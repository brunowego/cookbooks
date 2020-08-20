# Query Exporter for Prometheus

## References

- [Git Repository](https://github.com/albertodonato/query-exporter)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h query_exporter \
  -p 9560:9560/tcp \
  --name query_exporter \
  --network workbench \
  docker.io/adonato/query-exporter:2.0.1
```

## CLI

### Dependencies

- [Prometheus](/prometheus.md)

```sh
# MySQL
pip install -U mysqlclient

# Db2
pip install -U ibm_db ibm_db_sa
```

### Installation

#### PIP

```sh
pip install -U query-exporter
```

### Commands

```sh
query-exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: query
  static_configs:
  - targets:
    - localhost:9560
EOF
)
```

```sh
# Homebrew
brew services restart prometheus
```

### Usage

#### Db2

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h db2 \
  -v db2-database:/database \
  -v db2-hadr:/hadr \
  -e LICENSE='accept' \
  -e DB2INSTANCE='user' \
  -e DB2INST1_PASSWORD='pass' \
  -e DBNAME='dev' \
  -e ARCHIVE_LOGS='false' \
  -e AUTOCONFIG='false' \
  -p 50000:50000 \
  --memory-swappiness 0 \
  --name db2 \
  --privileged \
  --ulimit memlock=-1:-1 \
  docker.io/ibmcom/db2:11.5.0.0a

#
docker logs -f db2 | sed '/(*) Setup has completed./ q'

#
docker exec db2 /opt/ibm/db2/V11.5/bin/db2 'CONNECT TO DEV'
docker exec db2 /opt/ibm/db2/V11.5/bin/db2 'SELECT CURRENT TIMESTAMP FROM SYSIBM.SYSDUMMY1'

#
DB2_DATABASE_DSN='db2+ibm_db://user:pass@127.0.0.1:50000/dev' query-exporter <(cat << EOF
databases:
  db1:
    dsn: env:DB2_DATABASE_DSN

metrics:
  metric1:
    type: gauge
    description: A sample gauge

queries:
  query1:
    interval: 5
    databases: [db1]
    metrics: [metric1]
    sql: |
      SELECT
          86400 *(
              DAYS(CURRENT TIMESTAMP - CURRENT TIMEZONE) - DAYS('1970-01-01')
          ) + MIDNIGHT_SECONDS(CURRENT TIMESTAMP - CURRENT TIMEZONE) "metric1"
      FROM
          SYSIBM.SYSDUMMY1

EOF
) \
  -H 0.0.0.0

echo -e '[INFO]\thttp://127.0.0.1:9560/metrics'

# Teardown
pkill -f query-exporter

#
docker rm -f db2
docker volume rm db2-database db2-hadr
```

#### MySQL

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='user' \
  -e MYSQL_PASSWORD='pass' \
  -e MYSQL_DATABASE='dev' \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name mysql \
  docker.io/library/mysql:5.7

#
docker exec mysql mysql \
  -u user \
  -p'pass' \
  -ve 'SELECT UNIX_TIMESTAMP(NOW()) AS epoch'

#
MYSQL_DATABASE_DSN='mysql+mysqldb://user:pass@127.0.0.1:3306/dev?autocommit=true' \
  query-exporter <(cat << EOF
databases:
  db1:
    dsn: env:MYSQL_DATABASE_DSN

metrics:
  metric1:
    type: gauge
    description: A sample gauge

queries:
  query1:
    interval: 5
    databases: [db1]
    metrics: [metric1]
    sql: SELECT UNIX_TIMESTAMP(NOW()) AS metric1

EOF
) \
  -H 0.0.0.0

echo -e '[INFO]\thttp://127.0.0.1:9560/metrics'

# Teardown
pkill -f query-exporter

#
docker rm -f mysql
docker volume rm mysql-data
```

### Issues

####

```log
2020-03-04 14:52:42,634 - ERROR - query-exporter - error from database "xxx": (ibm_db_dbi.Error) ibm_db_dbi::Error: [IBM][CLI Driver] SQL10007N Message "0" could not be retrieved.  Reason code: "3". SQLCODE=-1042
(Background on this error at: http://sqlalche.me/e/dbapi)
```

```sh
db2 get dbm cfg | grep -i '(authentication)'

# AUTHENTICATION=SERVER
```

####

```log
2020-03-04 09:37:54,266 - ERROR - query-exporter - error from database "xxx": (ibm_db_dbi.OperationalError) ibm_db_dbi::OperationalError: [IBM][CLI Driver] SQL30081N  A communication error has been detected. Communication protocol being used: "TCP/IP".  Communication API being used: "SOCKETS".  Location where the error was detected: "172.17.78.128".  Communication function detecting the error: "connect".  Protocol specific error code(s): "113", "*", "*".  SQLSTATE=08001 SQLCODE=-30081
(Background on this error at: http://sqlalche.me/e/e3q8)
```

TODO

### Uninstall

```sh
# PIP
pip uninstall query-exporter
```
