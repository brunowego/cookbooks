# Prometheus Adapter

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/prometheus-adapter#configuration)
- [Horizontal Pod Autoscaler](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)

### Dependencies

- [Prometheus](/prometheus.md#helm) or [Prometheus Operator](/prometheus-operator.md#helm)

### Install

```sh
helm install stable/prometheus-adapter \
  -n prometheus-adapter \
  --namespace monitoring \
  --set prometheus.url='http://prometheus-server.monitoring.svc.cluster.local' \
  --set prometheus.port='80'
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
helm delete prometheus-adapter --purge
```
