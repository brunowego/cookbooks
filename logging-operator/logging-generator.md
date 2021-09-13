# Logging Generator (Demo)

## References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-demo#configuration)

## Install

```sh
helm install logging-demo banzaicloud-stable/logging-demo \
  --namespace logging \
  --version 3.13.0 \
  -f <(cat << EOF
loggingOperator:
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
  --namespace logging \
  -f <(yq m <(cat << EOF
loggingOperator:
  fluentd:
    metrics:
      serviceMonitor: true
  fluentbit:
    metrics:
      serviceMonitor: true
EOF
) <(helm get values logging-demo --namespace logging))
```

## Status

```sh
kubectl rollout status deploy/logging-demo-log-generator \
  -n logging
```

## Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=log-generator' \
  -n logging \
  -f
```

## Delete

```sh
helm uninstall logging-demo \
  -n logging
```
