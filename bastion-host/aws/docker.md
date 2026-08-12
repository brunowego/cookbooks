# Bastion Host with Docker

## Installation

```sh
#
aws ssm start-session --target <instance-id>

#
curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ | \
  xargs -I{} curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/{}vpc-ipv4-cidr-block; echo

#
cat /etc/os-release

#
sudo amazon-linux-extras install docker -y

#
sudo systemctl start docker
sudo systemctl enable docker

#
sudo usermod -aG docker $(whoami)
newgrp docker

#
docker --version

#
docker run --rm hello-world
```

## PostgreSQL Dump

```sh
#
aws ssm start-session --target <instance-id>

#
sudo yum install -y tmux

#
tmux new -s dump

#
export RDS_HOST='<hostname>'
export RDS_USER='<username>'
export RDS_DB='<database>'
export PGPASSWORD='<password>'
export S3_BUCKET='<bucket>'
export S3_REGION='<region>'
export S3_PATH='<path>'
export DUMP_FILENAME="<filename>-$(date -u '+%Y-%m-%d').dump"

#
docker run \
  --rm \
  --network host \
  -e PGPASSWORD="$PGPASSWORD" \
  docker.io/library/postgres:16 \
  psql -h "$RDS_HOST" -U "$RDS_USER" -d "$RDS_DB" \
  -c "SELECT version();"

#
docker run \
  --rm \
  --log-driver=none \
  --network host \
  -e PGPASSWORD="$PGPASSWORD" \
  docker.io/library/postgres:16 \
  pg_dump -h "$RDS_HOST" -U "$RDS_USER" -d "$RDS_DB" --no-owner --no-privileges | \
    gzip | \
      aws s3 cp - s3://"$S3_BUCKET"/"$S3_PATH"/"$DUMP_FILENAME" --region "$S3_REGION"

#
aws s3api list-multipart-uploads --bucket "$S3_BUCKET" --region "$S3_REGION"

#
export UPLOAD_ID='<upload-id>'

#
aws s3api list-parts \
  --bucket "$S3_BUCKET" \
  --key "$S3_PATH"/"$DUMP_FILENAME" \
  --upload-id "$UPLOAD_ID" --region "$S3_REGION" \
  --query "sum(Parts[].Size)"

aws s3api list-parts \
  --bucket "$S3_BUCKET" \
  --key "$S3_PATH"/"$DUMP_FILENAME" \
  --upload-id "$UPLOAD_ID" --region "$S3_REGION" \
  --query "length(Parts)"

#
watch -n 30 "aws s3api list-parts \
  --bucket "$S3_BUCKET" \
  --key "$S3_PATH"/"$DUMP_FILENAME" \
  --upload-id "$UPLOAD_ID" \
  --region "$S3_REGION" --query \"sum(Parts[].Size)\""

#
aws s3 cp s3://"$S3_BUCKET"/"$S3_PATH"/"$DUMP_FILENAME" \
  ./"$DUMP_FILENAME" --region "$S3_REGION"

#
gunzip -t "$DUMP_FILENAME" && echo "ok, file is valid" || echo "error, file is invalid"

#
# gunzip -c "$DUMP_FILENAME" | \
#   psql -h <hostname> -U <username> -d <database>

#
# export LOCAL_DB_USER='<username>'
# export LOCAL_DB_NAME='<database>'
# export LOCAL_DOCKER_CONTAINER_NAME='<container-name>'

# gunzip -c "$DUMP_FILENAME" | \
#   docker exec -i "$LOCAL_DOCKER_CONTAINER_NAME" psql -U "$LOCAL_DB_USER" -d "$LOCAL_DB_NAME" -v ON_ERROR_STOP=1

#
# pv "$DUMP_FILENAME" | \
#   gunzip -c | \
#     docker exec -i "$LOCAL_DOCKER_CONTAINER_NAME" psql -U "$LOCAL_DB_USER" -d "$LOCAL_DB_NAME" -v ON_ERROR_STOP=1

#
tmux ls
tmux attach -t dump

#
sudo systemctl stop docker
sudo systemctl disable docker
```

## PostgreSQL Import (From Docker Container)

```sh
#
export DUMP_FILENAME='<filename>'
export DB_CONTAINER_NAME='<container-name>'
export DB_NAME='<database-name>'

# Copy the dump
docker cp "$DUMP_FILENAME" "$DB_CONTAINER_NAME:/tmp/$DUMP_FILENAME"

# List the files in the container
docker exec "$DB_CONTAINER_NAME" ls -lh /tmp

# Create the DB (if needed)
docker exec -it "$DB_CONTAINER_NAME" psql -U postgres -c "CREATE DATABASE "$DB_NAME";"

# Restore
# docker exec -it "$DB_CONTAINER_NAME" pg_restore \
#   -U postgres \
#   -d "$DB_NAME" \
#   --no-owner \
#   --no-privileges \
#   --jobs=4 \
#   -v \
#   /tmp/"$DUMP_FILENAME"

# Restore
docker exec -it "$DB_CONTAINER_NAME" \
  bash -c "gunzip -c /tmp/$DUMP_FILENAME | psql -U postgres -d $DB_NAME -v ON_ERROR_STOP=1"

# Remove the dump from the container
docker exec "$DB_CONTAINER_NAME" rm /tmp/"$DUMP_FILENAME"

# Watch what postgres is actively doing
docker exec -it "$DB_CONTAINER_NAME" psql -U postgres -d "$DB_NAME" \
  -c "SELECT pid, phase, blocks_done, blocks_total, tuples_done, tuples_total FROM pg_stat_progress_create_index;"
```
