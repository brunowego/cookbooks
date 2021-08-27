# RDS Exporter for Prometheus

<!--
https://github.com/pavanyadavalli/koku/tree/main/openshift/buildenv/rdsexporter
https://github.com/kuny1240/Insight_Project/tree/master/configs
-->

## Links

- [Code Repository](https://github.com/percona/rds_exporter)

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/percona/rds_exporter/releases/download/v0.7.1/rds_exporter_darwin_amd64.tar.gz' | \
    tar -xzC /usr/local/bin
```

#### Linux Binary

```sh
curl \
  -L 'https://github.com/percona/rds_exporter/releases/download/v0.7.1/rds_exporter_linux_amd64.tar.gz' | \
    sudo tar -xzC /usr/local/bin
```

### Commands

```sh
rds_exporter --help
```

### Usage

```sh
#
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''

#
rds_exporter --config.file <(cat << EOF
instances:
- region: us-east-1
  instance: rds-aurora1
EOF
)

#
echo -e '[INFO]\thttp://127.0.0.1:9042/basic'
echo -e '[INFO]\thttp://127.0.0.1:9042/enhanced'
```

<!--
- region: us-east-1
  instance: rds-aurora1
  aws_access_key: $AWS_ACCESS_KEY_ID
  aws_secret_key: $AWS_SECRET_ACCESS_KEY
  disable_basic_metrics: true
  disable_enhanced_metrics: false
-->
