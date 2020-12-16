# PostgreSQL Server

## CLI

### Installation

#### Homebrew

```sh
brew install postgresql
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y postgresql-server
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

### Remove

```sh
docker rm -f postgresql

docker volume rm postgresql-data
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
