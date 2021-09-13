# Loki

## Links

- [Main Website](https://grafana.com/oss/loki/)

## Helm

### References

- [Helm Repository](https://github.com/grafana/helm-charts/tree/main/charts/loki)

### Repository

```sh
helm repo add grafana 'https://grafana.github.io/helm-charts'
helm repo update
```

### Dependencies

- Assuming there is already a `logging` namespace.

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
helm install loki grafana/loki \
  --namespace logging \
  --version 2.6.0 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - host: loki.${INGRESS_HOST}.nip.io
    paths:
    - /
EOF
)
```

### Status

```sh
kubectl rollout status statefulset/loki \
  -n logging
```

### Logs

```sh
kubectl logs \
  -l 'release=loki' \
  -n logging \
  -f
```

### Delete

```sh
helm uninstall loki \
  -n logging
```

## CLI

### Installation

#### Homebrew

```sh
brew install loki
```

### Commands

```sh
loki -h
```
