# Lens Metrics

## Enable

1. Cluster -> Settings
2. Settings -> Extensions -> Lens Metrics

A namespace called `lens-metrics` will be created with the selected features enabled.

- Prometheus Stack
- Kube-State-Metrics (KSM)
- Node Exporter

## Debug

```sh
#
kubens lens-metrics

#
kubectl get all

#
kubectl logs \
  -l 'name=kube-state-metrics' \
  -f

kubectl logs \
  -l 'name=node-exporter' \
  -f

kubectl logs \
  -l 'name=prometheus' \
  -f
```
