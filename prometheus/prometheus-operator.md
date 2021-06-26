# Prometheus Operator

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/prometheus-operator#configuration)

### Repository

```sh
helm repo add stable https://charts.helm.sh/stable
helm repo update
```

### Install

```sh
kubectl create namespace monitoring
```

```sh
# Using minikube
helm install prometheus-operator stable/prometheus-operator \
  --namespace monitoring \
  --version 11.0.1 \
  --set prometheus.ingress.enabled=true \
  --set prometheus.ingress.hosts={prometheus.${INGRESS_HOST}.nip.io} \
  --set alertmanager.ingress.enabled=true \
  --set alertmanager.ingress.hosts={alertmanager.${INGRESS_HOST}.nip.io} \
  --set grafana.adminPassword="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set grafana.ingress.enabled=true \
  --set grafana.ingress.hosts={grafana.${INGRESS_HOST}.nip.io}
```

<!-- # Using Kubernetes IN Docker (kind)
helm install prometheus-operator stable/prometheus-operator \
  --namespace monitoring \
  --version 11.0.1 \
  --set prometheus.ingress.enabled=true \
  --set prometheus.ingress.hosts={prometheus.cluster.local} \
  --set alertmanager.ingress.enabled=true \
  --set alertmanager.ingress.hosts={alertmanager.cluster.local} \
  --set grafana.adminPassword="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set grafana.ingress.enabled=true \
  --set grafana.ingress.hosts={grafana.cluster.local} -->

### Status

```sh
kubectl rollout status deploy/prometheus-operator-operator \
  -n monitoring
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
helm uninstall prometheus-operator \
  -n prometheus-operator

kubectl delete namespace monitoring \
  --grace-period=0 \
  --force
```
