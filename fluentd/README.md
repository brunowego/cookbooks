# Fluentd

## Links

- [Code Repository](https://github.com/fluent/fluentd)
- [Main Website](https://fluentd.org/)

## Helm

### References

- [Helm Repository](https://github.com/fluent/helm-charts/tree/main/charts/fluentd)

### Repository

```sh
helm repo add fluent 'https://fluent.github.io/helm-charts'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)
- Assuming there is already a `logging` namespace.

### Install

```sh
helm install fluentd fluent/fluentd \
  --namespace logging \
  --version 0.2.10 \
  -f <(cat << EOF
autoscaling:
  enabled: true

metrics:
  serviceMonitor:
    enabled: true
    additionalLabels:
      release: prometheus-stack
EOF
)
```

### Delete

```sh
helm uninstall fluentd \
  -n logging
```
