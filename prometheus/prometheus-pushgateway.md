# Prometheus Pushgateway

## Links

- [Code Repository](https://github.com/prometheus/pushgateway)

## Helm

### References

- [Configuration](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-pushgateway#configuration)

### Repository

```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

### Install

```sh
kubectl create namespace monitoring
```

```sh
helm install pushgateway prometheus-community/prometheus-pushgateway \
  --namespace monitoring \
  --version 1.10.1 \
  --set ingress.enabled=true \
  --set ingress.hosts={pushgateway.${INGRESS_HOST}.nip.io}
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
echo -e "[INFO]\thttp://pushgateway.${INGRESS_HOST}.nip.io"
```

### Delete

```sh
helm uninstall prometheus \
  -n monitoring

kubectl delete namespace monitoring \
  --grace-period=0 \
  --force
```
