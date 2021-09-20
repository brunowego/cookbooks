# Elastic APM Server

## Links

- [Code Repository](https://github.com/elastic/apm)
- [Main Website](https://elastic.co/apm/)

## Helm

### References

- [Configuration](https://github.com/elastic/helm-charts/blob/master/apm-server/README.md#configuration)

### Repository

```sh
helm repo add elastic 'https://helm.elastic.co'
helm repo update
```

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
kubectl create ns elastic-system
```

```sh
helm install apm-server elastic/apm-server \
  --namespace elastic-system \
  --version 7.13.2 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - apm.${INGRESS_HOST}.nip.io
EOF
)
```

### Status

```sh
kubectl rollout status deploy/apm-server-apm-server \
  -n elastic-system
```

### Logs

```sh
kubectl logs \
  -l 'release=apm-server' \
  -n elastic-system \
  -f
```

### Ingress

```sh
#
echo -e "[INFO]\thttp://apm.${INGRESS_HOST}.nip.io"
```

### Delete

```sh
helm uninstall apm-server \
  -n elastic-system

kubectl delete ns elastic-system \
  --grace-period=0 \
  --force
```
