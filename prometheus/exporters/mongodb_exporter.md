# MongoDB Exporter for Prometheus

## Helm

### References

- [Configuration](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-mongodb-exporter#configuration)

### Repository

```sh
helm repo add prometheus-community 'https://prometheus-community.github.io/helm-charts'
helm repo update
```

### Dependencies

- [MongoDB)](/mongodb/README.md#helm)
- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
#
helm install prometheus-mongodb-exporter prometheus-community/prometheus-mongodb-exporter \
  --namespace mongodb \
  --version 2.8.1 \
  -f <(cat << EOF
mongodb:
  uri: mongo-mongodb.mongodb.svc.cluster.local

serviceMonitor:
  additionalLabels:
    release: prometheus
EOF
)
```

### Status

```sh
kubectl rollout status deploy/prometheus-mongodb-exporter \
  -n mongodb
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=prometheus-mongodb-exporter' \
  -n mongodb \
  -f
```

### Port Forward

```sh
kubectl port-forward service/prometheus-mongodb-exporter 9216 \
  -n mongodb
```

### Delete

```sh
helm uninstall prometheus-mongodb-exporter \
  -n mongodb
```
