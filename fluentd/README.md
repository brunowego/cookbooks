# Fluentd

<!--
https://github.com/GoogleCloudPlatform/fluent-plugin-detect-exceptions
-->

## Links

- [Code Repository](https://github.com/fluent/fluentd)
- [Main Website](https://fluentd.org/)

## Helm

### References

- [Chart Repository](https://github.com/fluent/helm-charts/tree/main/charts/fluentd)

### Repository

```sh
helm repo add fluent 'https://fluent.github.io/helm-charts'
helm repo update
```

### Dependencies

- Assuming there is already a `logging` namespace.

### Install

```sh
helm install fluentd fluent/fluentd \
  --namespace logging \
  --version 0.2.10 \
  -f <(cat << EOF
autoscaling:
  enabled: true
EOF
)
```

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade fluentd fluent/fluentd \
  --namespace logging \
  -f <(yq m <(cat << EOF
metrics:
  serviceMonitor:
    enabled: true
    additionalLabels:
      release: prometheus-stack
EOF
) <(helm get values fluentd --namespace logging))
```

### Delete

```sh
helm uninstall fluentd \
  -n logging
```
