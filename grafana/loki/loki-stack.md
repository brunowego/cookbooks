# Grafana Loki Stack

<!--
https://grafana.github.io/loki/charts/

helm3 upgrade --install loki -n logging --create-namespace grafana/loki-stack --version 2.4.1 --set grafana.enabled=true
-->

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

### Dependencies

- Assuming there is already a `logging` namespace.

### Install

```sh
# Loki Stack (Loki, Promtail, Grafana)
helm install loki-stack grafana/loki-stack \
  --namespace logging \
  --version 2.4.1 \
  -f <(cat << EOF
grafana:
  enabled: true
EOF
)

# Loki, Fluent Bit, Grafana
helm install loki-stack grafana/loki-stack \
  --namespace logging \
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
  -n logging
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=loki' \
  -n logging \
  -f
```

### Secrets

```sh
kubectl get secret loki-grafana \
  -o=jsonpath='{.data.admin-user}' \
  -n logging | \
    base64 --decode; echo

kubectl get secret loki-grafana \
  -o=jsonpath='{.data.admin-password}' \
  -n logging | \
    base64 --decode; echo
```

### Port Forward

```sh
kubectl port-forward svc/loki-grafana 3000:80 \
  -n logging
```

<!-- {namespace="logging"} -->

### Delete

```sh
helm uninstall loki-stack \
  -n logging
```
