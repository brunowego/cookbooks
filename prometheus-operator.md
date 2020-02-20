# Prometheus Operator

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/prometheus-operator#configuration)

### Install

```sh
kubectl create namespace monitoring
```

```sh
helm install stable/prometheus-operator \
  -n prometheus-operator \
  --namespace monitoring \
  --set prometheus.ingress.enabled=true \
  --set prometheus.ingress.hosts={prometheus.$(minikube ip).nip.io} \
  --set alertmanager.ingress.enabled=true \
  --set alertmanager.ingress.hosts={alertmanager.$(minikube ip).nip.io} \
  --set grafana.adminPassword="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set grafana.ingress.enabled=true \
  --set grafana.ingress.hosts={grafana.$(minikube ip).nip.io}
```

### Status

```sh
kubectl rollout status deploy/prometheus-operator-operator -n monitoring
```

### Logs

```sh
kubectl logs \
  -l 'app=prometheus' \
  -c prometheus \
  -n monitoring \
  -f
```

### DNS

```sh
dig @10.96.0.10 prometheus-operator-prometheus.monitoring.svc.cluster.local +short
nslookup prometheus-operator-prometheus.monitoring.svc.cluster.local 10.96.0.10
```

### Secret

```sh
kubectl get secret prometheus-operator-grafana \
  -o jsonpath='{.data.admin-password}' \
  -n monitoring | \
    base64 --decode; echo
```

### Delete

```sh
helm delete prometheus-operator --purge
kubectl delete namespace monitoring --grace-period=0 --force
```
