# Prometheus Pushgateway

## Links

- [Code Repository](https://github.com/prometheus/pushgateway)

## Helm

### References

- [Configuration](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-pushgateway#configuration)

### Repository

```sh
helm repo add prometheus-community 'https://prometheus-community.github.io/helm-charts'
helm repo update
```

### Dependencies

- Assuming there is already a `monitoring` stack (namespace).

### Install

```sh
helm install pushgateway prometheus-community/prometheus-pushgateway \
  --namespace monitoring \
  --version 1.10.1 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - pushgateway.${K8S_DOMAIN}
EOF
)
```

### Status

```sh
kubectl rollout status deploy/pushgateway-prometheus-pushgateway \
  -n monitoring
```

### Logs

```sh
kubectl logs \
  -l 'release=pushgateway' \
  -n monitoring \
  -f
```

### Ingress

```sh
echo -e "[INFO]\thttp://pushgateway.${K8S_DOMAIN}"
```

### Delete

```sh
helm uninstall pushgateway \
  -n monitoring
```
