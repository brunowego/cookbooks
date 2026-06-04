# Bastion Host with Docker

## Installation

```sh
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
  --region "$S3_REGION" --query "sum(Parts[].Size)""

#
gunzip -c "$DUMP_FILENAME" | \
  psql -h <hostname> -U <username> -d <database>
```
