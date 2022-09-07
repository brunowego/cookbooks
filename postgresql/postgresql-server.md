# PostgreSQL Server

<!--
PostgreSQL is known to be faster while handling massive data sets, complicated queries, and read-write operations. Meanwhile, MySQL is known to be faster with read-only commands.
-->

## CLI

### Installation

#### Homebrew

```sh
# Version 11.x
brew install postgresql@11
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

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# PostgreSQL
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
```

### Initialize

```sh
# Homebrew
initdb -A trust /usr/local/var/postgres
initdb -E utf8 /usr/local/var/postgres

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
brew services start postgresql@11

# Systemd
sudo systemctl enable --now postgresql
```

### Issues

<!--
psql -d <db-name> -c 'GRANT ALL PRIVILEGES ON DATABASE <db-name> TO <user-name>'
-->

#### Missing Ownership of Table

```log
ERROR: must be owner of table <table-name>
```

```sh
psql '<db-name>' -c 'ALTER DATABASE <db-name> OWNER TO <user-name>;'
```

#### Missing Permission

```log
ERROR: permission denied for table <table-name>
```

```sh
psql '<db-name>' -c 'GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO <user-name>;'
```

#### Missing Role

```log
2022-09-06 15:55:51.140 -03 [94533] FATAL:  role "<name>" does not exist
```

```sh
psql '<db-name>' -c 'CREATE ROLE <name> WITH login;'
```

#### TBD

```log
initdb: error: The program "postgres" is needed by initdb but was not found in the
same directory as "/usr/local/Cellar/libpq/14.5/bin/initdb".
Check your installation.
```

TODO

<!--
TEST: Missing environment PATH variable.
-->

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
```

```sh
sudo hostess add postgresql 127.0.0.1
```

```env
DATABASE_URL=postgresql://user:pass@127.0.0.1:5432/dev
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

<!-- ### Issues -->

#### Missing Socket Connection

```log
dropdb: error: connection to server on socket "/tmp/.s.PGSQL.5432" failed: No such file or directory
```

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_HOST_AUTH_METHOD='trust' \
  -v postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name postgresql \
  --network workbench \
  docker.io/library/postgres:13.7-alpine

#
export PGHOST='localhost'
export PGUSER='postgres'
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
