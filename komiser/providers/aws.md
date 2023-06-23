# AWS Provider

## Configuration

```sh
#
komiser config

#
mkdir ~/.komiser

cat << EOF > ~/.komiser/config.toml
[[aws]]
name="ACME"
source="CREDENTIALS_FILE"
path="$HOME/.aws/credentials"
profile="default"

[sqlite]
file="$HOME/.komiser/komiser.db"
EOF
```

## Usage

```sh
#
komiser start \
  --config ~/.komiser/config.toml \
  --port 3000 \
  --regions us-east-1 \
  --telemetry false
```

## Issues

### TBD

```log
ERRO[2023-06-21T13:17:14-03:00] error fetching AWS resources                  err="<nil>"
```

TODO
