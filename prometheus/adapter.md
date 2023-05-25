# Prometheus Adapter for Kubernetes Metrics APIs

## Links

- [Code Repository](https://github.com/kubernetes-sigs/prometheus-adapter)

## Helm

### References

- [Configuration](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-adapter#configuration)

### Repository

```sh
helm repo add prometheus-community 'https://prometheus-community.github.io/helm-charts'
helm repo update
```

### Install

```sh
helm install prometheus-adapter prometheus-community/prometheus-adapter \
  --namespace monitoring \
  --version 2.15.2
```

### Status

```sh
kubectl rollout status deploy/prometheus-adapter -n monitoring
```

### Logs

```sh
kubectl logs -l 'app=prometheus-adapter' -n monitoring -f
```

### DNS

```sh
dig @10.96.0.10 prometheus-adapter.monitoring.svc.cluster.local +short
nslookup prometheus-adapter.monitoring.svc.cluster.local 10.96.0.10
```

### Delete

```sh
helm uninstall prometheus-adapter \
  -n monitoring
```
