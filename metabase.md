# Metabase

<!--
https://github.com/tlrobinson/metabase-proxy-examples
https://github.com/heroku-examples/analytics-with-kafka-redshift-metabase
https://github.com/fhsgoncalves/metabase-sparksql-databricks-driver
https://configr.com/blog/medo-de-bi-pelo-alto-investimento-conheca-o-metabase/
-->

## Supported Databases

- Amazon Redshift
- BigQuery
- Druid
- Google Analytics
- H2
- MongoDB
- MySQL
- PostgreSQL
- Presto
- Snowflake
- Spark SQL
- SQL Server
- SQLite

## References

- [DB2 Driver](https://github.com/dludwig-jrt/metabase-db2-driver)

## CLI

### Installation

#### Homebrew

```sh
brew install metabase
```

### Services

```sh
# Homebrew
brew services start metabase
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/metabase#configuration)

### Install

```sh
kubectl create namespace metabase
```

```sh
helm install stable/postgresql \
  -n metabase-postgresql \
  --namespace metabase \
  --set postgresqlUsername='metabase' \
  --set postgresqlPassword='metabase' \
  --set postgresqlDatabase='metabase'
```

```sh
helm install stable/metabase \
  -n metabase \
  --namespace metabase \
  --set database.type='postgres' \
  --set database.host='postgresql.metabase.svc.cluster.local' \
  --set database.port='5432' \
  --set database.dbname='metabase' \
  --set database.username='metabase' \
  --set database.password='metabase' \
  --set ingress.enabled=true \
  --set ingress.hosts={metabase.$(minikube ip).nip.io}
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n metabase
```

```sh
helm upgrade metabase stable/metabase -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - metabase.$(minikube ip).nip.io
EOF
) <(helm get values metabase))
```

#### Remove

```sh
helm upgrade metabase stable/metabase -f <(yq d <(helm get values metabase) ingress.tls)

kubectl delete secret example.tls-secret -n metabase
```

### Status

```sh
kubectl rollout status deploy/metabase-metabase -n metabase
```

### Logs

```sh
kubectl logs -l 'app=metabase' -n metabase -f
```

### DNS

```sh
dig @10.96.0.10 metabase.metabase.svc.cluster.local +short
nslookup metabase.metabase.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "metabase.$(minikube ip).nip.io" +short
nslookup "metabase.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret metabase-metabase-database \
  -o jsonpath='{.data.username}' \
  -n metabase | \
    base64 --decode; echo

kubectl get secret metabase-metabase-database \
  -o jsonpath='{.data.password}' \
  -n metabase | \
    base64 --decode; echo
```

### Delete

```sh
helm delete metabase-postgresql --purge
helm delete metabase --purge
kubectl delete namespace metabase --grace-period=0 --force
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
  -h postgres \
  -e POSTGRES_USER='metabase' \
  -e POSTGRES_PASSWORD='metabase' \
  -e POSTGRES_DB='metabase' \
  -v metabase-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name metabase-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h metabase \
  -e MB_DB_TYPE='postgres' \
  -e MB_DB_DBNAME='metabase' \
  -e MB_DB_PORT='5432' \
  -e MB_DB_USER='metabase' \
  -e MB_DB_PASS='metabase' \
  -e MB_DB_HOST='metabase-postgres' \
  -p 3000:3000 \
  --name metabase \
  --network workbench \
  docker.io/metabase/metabase:v0.34.1
```

> Wait! This process take a while.

```sh
docker logs -f metabase | sed '/Metabase Initialization COMPLETE/ q'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Database

```sh
# Backup
PGPASSWORD='metabase' pg_dump \
  -d metabase \
  -h 127.0.0.1 \
  -U metabase \
  > /path/to/dump/metabase-$(gdate +%Y-%m-%d-%H-%M).sql

# Restore
TODO
```

### Remove

```sh
docker rm -f metabase-postgres metabase

docker volume rm metabase-postgres-data
```

## Host

### Build

<!--
https://www.metabase.com/docs/latest/operations-guide/running-metabase-on-debian.html
-->

```sh
#
export METABASE_VERSION=0.34.1

#
mkdir -p /usr/local/src/metabase && cd "$_"

# cURL
curl -L https://github.com/metabase/metabase/archive/v$METABASE_VERSION.tar.gz | \
  tar -xzC /usr/local/src/metabase --transform s/metabase-// && \
    cd ./$METABASE_VERSION

#
lein install-for-building-drivers

#
yarn install
yarn build

#
lein ring server
# nohup lein ring server &
# nohup lein ring server-headless &
# nohup lein ring server-headless 8080 > /dev/null 2>&1 &

#
rm ./metabase.db.*
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Tips

#### Proxy

TODO

<!--
https://stackoverflow.com/questions/57881019/i-cant-get-atom-text-editor-leiningen-proto-repl-to-work-for-programming-c
-->

## Docs

### Ldap

1. Settings
2. Admin
3. Authentication
4. LDAP
   - Server Settings

### Druid

1. Settings
2. Admin
3. Databases -> Add database
   - Name: wikipedia
   - Host: http://druid-broker
   - Save
