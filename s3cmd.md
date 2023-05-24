# AWS S3 Tools (S3cmd)

## Guides

- [S3cmd: FAQ and Knowledge Base](https://s3tools.org/kb/item14.htm)

## CLI

### Installation

#### Homebrew

```sh
brew install s3cmd
```

### Configuration

#### MinIO

```sh
cat << EOF > ~/.s3cfg
[default]
host_base = https://minio.xyz.tld
host_bucket = https://minio.xyz.tld
use_https = True

access_key = [access-key]
secret_key = [secret-key]
EOF
```

### Commands

```sh
s3cmd -h
```

### Usage

```sh
#
s3cmd sync \
  --config ~/.s3cfg \
  /var/log/nginx \
  s3://[bucket]

#
s3cmd get s3://[bucket]
```
