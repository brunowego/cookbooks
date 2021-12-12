# PostgreSQL Server

<!--
PostgreSQL is known to be faster while handling massive data sets, complicated queries, and read-write operations. Meanwhile, MySQL is known to be faster with read-only commands.
-->

## CLI

### Installation

#### Homebrew

```sh
brew install postgresql
```

#### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install postgresql
```

#### YUM

```sh
sudo zypper refresh
sudo zypper install -y postgresql-server
```

#### APK

```sh
sudo apk update
sudo apk add postgresql
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y postgresql-server
```

#### Chocolatey

```sh
choco install -y postgresql
```

### Initialize

```sh
# Homebrew
initdb /usr/local/var/postgres

# Linux
sudo postgresql-setup initdb
```

### Configuration

```sh
# Homebrew
sed -i 's/^#listen_addresses =/listen_addresses =/' /usr/local/var/postgres/postgresql.conf
sed -i "/^listen_addresses/ s/'localhost'/'*'\t/g" /usr/local/var/postgres/postgresql.conf
echo 'host    all             all             0.0.0.0/0               md5' >> /usr/local/var/postgres/pg_hba.conf

# Linux
sudo sed -i 's/^#listen_addresses =/listen_addresses =/' /var/lib/pgsql/data/postgresql.conf
sudo sed -i "/^listen_addresses/ s/'localhost'/'*'\t/g" /var/lib/pgsql/data/postgresql.conf
sudo sed -i '/^local/ s/peer/md5/g' /var/lib/pgsql/data/pg_hba.conf
```

### Service

```sh
# Homebrew
brew services start postgres

# Systemd
sudo systemctl enable --now postgresql
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# 9.x
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='user' \
  -e POSTGRES_PASSWORD='pass' \
  -e POSTGRES_DB='dev' \
  -v postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgresql \
  --network workbench \
  docker.io/library/postgres:9.6-alpine

# 11.x
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='user' \
  -e POSTGRES_PASSWORD='pass' \
  -e POSTGRES_DB='dev' \
  -v postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgresql \
  --network workbench \
  docker.io/library/postgres:11.2-alpine

# 12.x
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='user' \
  -e POSTGRES_PASSWORD='pass' \
  -e POSTGRES_DB='dev' \
  -v postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgresql \
  --network workbench \
  docker.io/library/postgres:12.6-alpine

# Trust auth method
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_HOST_AUTH_METHOD='trust' \
  -v postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgresql \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
sudo hostess add postgresql 127.0.0.1
```

### Query

```sh
docker exec -i postgresql psql -U postgres <<-EOSQL

EOSQL
```

### Copy Schema/Data SQL File

```sh
docker cp ./schema.sql postgresql:/docker-entrypoint-initdb.d/schema.sql
docker cp ./data.sql postgresql:/docker-entrypoint-initdb.d/data.sql

docker exec \
  -u postgres \
  postgresql \
    psql dev postgres \
      -f docker-entrypoint-initdb.d/schema.sql

docker exec \
  -u postgres \
  postgresql \
    psql dev postgres -f docker-entrypoint-initdb.d/data.sql
```

### Remove

```sh
docker rm -f postgresql

docker volume rm postgresql-data
```

## Helm

### References

- [Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/postgresql)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns postgresql

#
helm install postgresql bitnami/postgresql \
  --namespace postgresql \
  --version 10.7.1 \
  -f <(cat << EOF
postgresqlPassword: postgres
EOF
)
```

### Status

```sh
kubectl rollout status statefulset/postgresql-postgresql \
  -n postgresql
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=postgresql' \
  -n postgresql \
  -f
```

### Secret

```sh
kubectl get secret postgresql \
  -o jsonpath='{.data.postgresql-password}' \
  -n postgresql | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall postgresql \
  -n postgresql

kubectl delete ns postgresql \
  --grace-period=0 \
  --force
```
