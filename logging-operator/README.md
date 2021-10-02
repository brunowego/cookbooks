# Logging Operator

## Links

- [Code Repository](https://github.com/banzaicloud/logging-operator)
- [Main Website](https://banzaicloud.com/products/logging-operator/)
- [Grafana Dashboard](https://grafana.com/grafana/dashboards/7752)

## Guides

- [Quickstarts](https://github.com/banzaicloud/logging-operator-docs/tree/master/docs/quickstarts)
- [FluentBit](https://banzaicloud.com/docs/one-eye/logging-operator/configuration/fluentbit/)
- [Tail](https://github.com/fluent/fluent-bit-docs/blob/1.3/input/tail.md)

## Helm

### References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-operator#configuration)

### Repository

```sh
helm repo add banzaicloud-stable 'https://kubernetes-charts.banzaicloud.com'
helm repo update
```

### Install

```sh
#
kubectl create ns logging-system

#
helm install logging-operator banzaicloud-stable/logging-operator \
  --namespace logging-system \
  --version 3.14.2
```

<!--
createCustomResource: true
-->

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade logging-operator banzaicloud-stable/logging-operator \
  --namespace logging-system \
  -f <(yq m <(cat << EOF
monitoring:
  serviceMonitor:
    enabled: true
EOF
) <(helm get values logging-operator --namespace logging-system))
```

### Status

```sh
kubectl rollout status deploy/logging-operator \
  -n logging-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=logging-operator' \
  -n logging-system \
  -f
```

### Delete

```sh
helm uninstall logging-operator \
  -n logging-system

kubectl delete ns logging-system \
  --grace-period=0 \
  --force
```
