# Db2 Exporter for Prometheus

## References

- [Git Repository](https://github.com/glinuz/db2_exporter)

## CLI

### Dependencies

- [Prometheus](/prometheus.md)
- [IBM Db2](/ibm_db2.md)

### Installation

#### Binary

```sh
# Linux
DB2_EXPORTER_VERSION="$(curl -ks https://api.github.com/repos/glinuz/db2_exporter/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -kL "https://github.com/glinuz/db2_exporter/releases/download/${DB2_EXPORTER_VERSION}/db2_exporter-linux-amd64.gz" | \
    gunzip > /usr/local/bin/db2_exporter && chmod +x /usr/local/bin/db2_exporter
```

### Commands

```sh
db2_exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: db2
  static_configs:
  - targets:
    - localhost:9161
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
  --network workbench \
  --privileged \
  --ulimit memlock=-1:-1 \
  docker.io/ibmcom/db2:11.5.0.0a

# docker run --rm --network workbench -p 9161:9161 docker.io/brunowego/db2_exporter:latest \
#   -dsn='DSN:DATABASE=dev; HOSTNAME=db2; PORT=50000; PROTOCOL=TCPIP; UID=user; PWD=pass;' \
#   -web.listen-address=':9161'

#
db2_exporter \
  -dsn='DSN:DATABASE=dev; HOSTNAME=localhost; PORT=50000; PROTOCOL=TCPIP; UID=user; PWD=pass;' \
  -web.listen-address=':9161'

echo -e '[INFO]\thttp://127.0.0.1:9399/metrics'

# Teardown
pkill db2_exporter

#
docker rm -f db2
docker volume rm db2-database db2-hadr
```

### Uninstall

```sh
# Binary
rm /usr/local/bin/db2_exporter
```
