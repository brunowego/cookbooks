# PostgreSQL

<!--
https://www.linkedin.com/learning/postgresql-essential-training/manage-relational-data-with-postgresql
-->

## References

- [JDBC Driver - Connecting to the Database](https://jdbc.postgresql.org/documentation/head/connect.html)
- [Data Types](https://www.postgresql.org/docs/9.5/datatype.html#DATATYPE-TABLE)

## CLI

### Installation

#### Homebrew

```sh
brew install postgresql
```

#### APT

```sh
sudo apt update
sudo apt -y install postgresql-server postgresql-contrib
```

#### Yum

```sh
yum check-update
sudo yum -y install postgresql-server postgresql-contrib
```

#### Chocolatey

```sh
choco install -y postgresql
```

#### APK

```sh
sudo apk update
sudo apk add postgresql
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


### Commands

```sh
initdb --help
createdb --help
psql --help
```

### Defaults

```sh
# Homebrew
createdb \
  -E utf8 \
  -O "$USER" \
  -h 127.0.0.1 \
  -p 5432 \
  "$USER"

sudo -u "$USER" createuser 'postgres'
psql -c "ALTER USER postgres WITH PASSWORD 'postgres'"
```

### Usage

```sh
# User
## Create
sudo -u "$USER" createuser --interactive

## Drop
sudo -u "$USER" dropuser [name]

# Database
## Create
sudo -u "$USER" createdb [database]

## Drop
sudo -u "$USER" dropdb [database]

# Queries
sudo -u "$USER" psql -c '[command]'

# Or, with Here document
sudo -u "$USER" psql <<-EOSQL
[sql]
EOSQL

# Dump
## DDL
pg_dump \
  -d [db-name] \
  -h 127.0.0.1 \
  -U postgres \
  --schema-only \
  > ddl.sql

## Dump
pg_dump \
  -d [db-name] \
  -h 127.0.0.1 \
  -U postgres \
  --data-only \
  --column-inserts \
  > dml.sql
```

### Tips

#### Health check

```sh
lsof -i :5432
```

#### SSH Tunnel

```sh
ssh \
  -p [port] \
  -N \
  -L 5433:[hostname]:5432 \
  [username]@[hostname]

psql \
  -h 127.0.0.1 \
  -P 5433
```

### Issues

####

```log
ERROR: permission denied for table [table-name]
```

```sh
# One table
psql -c "GRANT ALL PRIVILEGES ON TABLE [table-name] TO [user-name]"

# All tables of schema
psql -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA [schema-name] TO [user-name]"
```

####

```log
ERROR: permission denied for sequence [seq-name]
```

```sh
psql -c "GRANT USAGE, SELECT ON SEQUENCE [seq-name] TO [user-name]"

psql -c "GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA [schema-name] TO [user-name]"
```

### Logs

```sh
# Homebrew
tail -f /usr/local/var/log/postgres.log

# Linux
sudo tail -f /var/lib/pgsql/initdb.log
sudo tail -f /var/lib/pgsql/data/pg_log/postgresql-Thu.log
```

### Uninstall

```sh
# Homebrew
brew services stop postgresql
brew uninstall postgres
rm -fR /usr/local/var/postgres
rm /usr/local/var/log/postgres.log
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/postgresql#configuration)

### Install

```sh
kubectl create namespace postgresql
```

```sh
helm install stable/postgresql \
  -n postgresql \
  --namespace postgresql \
  --set postgresqlPassword='postgres'
```

<!-- ### NGINX Ingress

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.5432 postgresql/postgresql:5432)
``` -->

### Status

```sh
kubectl rollout status statefulset/postgresql-postgresql -n postgresql
```

### Logs

```sh
kubectl logs -l 'app=postgresql' -n postgresql -f
```

### DNS

```sh
dig @10.96.0.10 postgresql.postgresql.svc.cluster.local +short
nslookup postgresql.postgresql.svc.cluster.local 10.96.0.10
```

### Secret

```sh
kubectl get secret postgresql \
  -o jsonpath='{.data.postgresql-password}' \
  -n postgresql | \
    base64 --decode; echo
```

### Delete

```sh
helm delete postgresql --purge

kubectl delete namespace postgresql --grace-period=0 --force
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
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
```

```sh
sudo hostess add postgresql 127.0.0.1
```

### Query

```sh
docker exec -i postgresql psql -U postgres <<-EOSQL

EOSQL
```

### Remove

```sh
docker rm -f postgresql

docker volume rm postgresql-data
```
