# logging operator

<!--
https://github.com/banzaicloud/logging-operator-docs/tree/master/docs/quickstarts
https://github.com/banzaicloud-build/logging-operator/blob/master/docs/examples/es.md
https://github.com/xybots/logging-operator-docs/blob/master/docs/operation/logging-operator-monitoring.md
-->

## Links

- [Code Repository](https://github.com/banzaicloud/logging-operator)
- [Main Website](https://banzaicloud.com/products/logging-operator/)

## Helm

### References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-operator#configuration)

### Repository

```sh
helm repo add banzaicloud-stable 'https://kubernetes-charts.banzaicloud.com'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
#
kubectl create namespace logging
```

```sh
helm install logging-operator banzaicloud-stable/logging-operator \
  --namespace logging \
  --version 3.12.0 \
  -f <(cat << EOF
monitoring:
  serviceMonitor:
    enabled: true
EOF
)
```

### Status

```sh
kubectl rollout status deploy/logging-operator \
  -n logging
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=logging-operator' \
  -n logging \
  -f
```

### Delete

```sh
helm uninstall logging-operator \
  -n logging

kubectl delete namespace logging \
  --grace-period=0 \
  --force
```