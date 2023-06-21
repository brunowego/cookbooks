# Kubernetes

## Configuration

```sh
#
komiser config

#
mkdir ~/.komiser

cat << EOF > ~/.komiser/config.toml
[[k8s]]
name="ACME"
path="$HOME/.kube/config"

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
