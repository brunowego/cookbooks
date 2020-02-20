# MySQL Exporter for Prometheus

## CLI

### Dependencies

- [Prometheus](/prometheus.md)

### Installation

#### Binary

```sh
# Darwin
curl -L 'https://github.com/prometheus/mysqld_exporter/releases/download/v0.12.1/mysqld_exporter-0.12.1.darwin-amd64.tar.gz' | \
  tar -xzC /usr/local/bin --wildcards --strip-components 1 'mysqld_exporter*/mysqld_exporter'
```

### Commands

```sh
mysqld_exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: mysql
  static_configs:
  - targets:
    - localhost:9104
EOF
)
```

```sh
# Homebrew
brew services restart prometheus
```

### Usage

#### Status

```sh
# Homebrew
brew services start mysql@5.7

mysqld_exporter \
  --web.listen-address=':9104' \
  --config.my-cnf="$HOME/.my.cnf"

echo -e '[INFO]\thttp://127.0.0.1:9104/metrics'

# Teardown
pkill mysqld_exporter

# Homebrew
brew services stop mysql@5.7
```
