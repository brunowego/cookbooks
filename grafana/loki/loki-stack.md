# Grafana Loki Stack

## Links

- [Code Repository](https://github.com/grafana/helm-charts/tree/main/charts/loki-stack)
- [Main Website](https://grafana.com/oss/loki/)

## Helm

### References

- [Chart Repository](https://github.com/grafana/helm-charts/tree/main/charts/loki-stack)

### Repository

```sh
helm repo add grafana 'https://grafana.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns logging-system
# kubectl create ns logging

#
helm search repo -l grafana/loki-stack

# Loki Stack (Loki, Promtail, Grafana)
helm install loki-stack grafana/loki-stack \
  --namespace logging-system \
  --version 2.4.1 \
  -f <(cat << EOF
grafana:
  enabled: true
EOF
)

# Loki, Fluent Bit, Grafana
helm install loki-stack grafana/loki-stack \
  --namespace logging-system \
  --version 2.4.1 \
  -f <(cat << EOF
grafana:
  enabled: true

fluent-bit:
  enabled: true

promtail:
  enabled: false
EOF
)
```

### Status

```sh
kubectl rollout status deploy/loki-grafana \
  -n logging-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=loki' \
  -n logging-system \
  -f
```

### Secrets

```sh
kubectl get secret loki-grafana \
  -o=jsonpath='{.data.admin-user}' \
  -n logging-system | \
    base64 -d; echo

kubectl get secret loki-grafana \
  -o=jsonpath='{.data.admin-password}' \
  -n logging-system | \
    base64 -d; echo
```

### Port Forward

```sh
kubectl port-forward svc/loki-grafana 3000:80 \
  -n logging-system
```

### Delete

```sh
helm uninstall logging \
  -n logging-system

kubectl delete ns logging-system \
  --grace-period=0 \
  --force
```
