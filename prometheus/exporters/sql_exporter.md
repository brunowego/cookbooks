# SQL Exporter for Prometheus

## References

- [Git Repository](https://github.com/free/sql_exporter)
- [SQL Driver for MySQL](https://github.com/go-sql-driver/mysql)

## Forks

- [DB2 Support](https://github.com/nubenum/sql_exporter/releases)

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
  -h sql_exporter \
  --name sql_exporter \
  --network workbench \
  docker.io/githubfree/sql_exporter:0.5
```

## CLI

### Dependencies

- [Prometheus](/prometheus.md)

### Installation

#### Binary

```sh
# Darwin
SQL_EXPORTER_VERSION="$(curl -s https://api.github.com/repos/free/sql_exporter/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -L "https://github.com/free/sql_exporter/releases/download/${SQL_EXPORTER_VERSION}/sql_exporter-${SQL_EXPORTER_VERSION}.darwin-amd64.tar.gz" | \
    tar -xzC /usr/local/bin --wildcards --strip-components 1 'sql_exporter*/sql_exporter'
```

### Commands

```sh
sql_exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: sql
  static_configs:
  - targets:
    - localhost:9399
EOF
)
```

```sh
# Homebrew
brew services restart prometheus
```

### Usage

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
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D dev \
  -u user \
  -p'pass' \
  -ve 'SELECT UNIX_TIMESTAMP(NOW()) AS epoch'

#
sql_exporter \
  -config.file=<(cat << EOF
global:
  scrape_timeout_offset: 500ms
  min_interval: 0s
  max_connections: 3
  max_idle_connections: 3

target:
  data_source_name: 'mysql://user:pass@tcp(127.0.0.1:3306)/dev'
  collectors:
    - base

collectors:
  - collector_name: base
    queries:
      - query_name: unix_timestamp
        query: |
          SELECT UNIX_TIMESTAMP(NOW()) AS epoch

    metrics:
      - metric_name: mysql_local_time_seconds
        type: gauge
        help: Local time in seconds since Unix epoch
        values: [epoch]
        query_ref: unix_timestamp

EOF
) \
  -web.listen-address=':9399'

echo -e '[INFO]\thttp://127.0.0.1:9399/metrics'

# Teardown
pkill sql_exporter

#
docker rm -f mysql
docker volume rm mysql-data
```

### Uninstall

```sh
# Binary
rm /usr/local/bin/sql_exporter
```
