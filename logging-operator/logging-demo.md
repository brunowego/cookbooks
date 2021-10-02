# Logging Demo

## References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-demo#configuration)

### Repository

```sh
helm repo add banzaicloud-stable 'https://kubernetes-charts.banzaicloud.com'
helm repo update
```

## Install

```sh
helm install logging-demo banzaicloud-stable/logging-demo \
  --namespace default \
  --version 3.14.2 \
  -f <(cat << EOF
loggingOperator:
  controlNamespace: logging-system

  tls:
    enabled: false
EOF
)
```

## Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade logging-demo banzaicloud-stable/logging-demo \
  --namespace default \
  -f <(yq m <(cat << EOF
loggingOperator:
  fluentd:
    metrics:
      serviceMonitor: true
  fluentbit:
    metrics:
      serviceMonitor: true
EOF
) <(helm get values logging-demo --namespace default))
```

## Status

```sh
kubectl rollout status deploy/logging-demo-log-generator \
  -n default
```

## Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=log-generator' \
  -n default \
  -f
```

## Delete

```sh
helm uninstall logging-demo \
  -n default
```
