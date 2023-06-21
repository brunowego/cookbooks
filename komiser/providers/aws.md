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
  --telemetry false
```
