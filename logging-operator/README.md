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

### Dependencies

- Assuming there is already a `logging` namespace.

### Install

```sh
helm install logging-operator banzaicloud-stable/logging-operator \
  --namespace logging \
  --version 3.14.2 \
  -f <(cat << EOF
tls:
  enabled: false
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
helm upgrade logging-operator banzaicloud-stable/logging-operator \
  --namespace logging \
  -f <(yq m <(cat << EOF
monitoring:
  serviceMonitor:
    enabled: true
EOF
) <(helm get values logging-operator --namespace logging))
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

### Logging

```sh
#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Logging
metadata:
  name: default-logging
spec:
  fluentd:
    scaling:
      replicas: 1
    # logLevel: debug
    # metrics:
    #   serviceMonitor: true
    #   serviceMonitorConfig:
    #     additionalLabels:
    #       release: prometheus-stack
    #   path: /metrics
    #   interval: 15s
  fluentbit:
    # filterKubernetes:
    #   Buffer_Size: 3M
    #   tls.verify: 'Off'
    inputTail:
      Buffer_Chunk_Size: 1M
      Buffer_Max_Size: 5M
      # Mem_Buf_Limit: 300M
      # Multiline_Flush: '2'
    # metrics:
    #   serviceMonitor: true
    #   serviceMonitorConfig:
    #     additionalLabels:
    #       release: prometheus-stack
    #   path: /api/v1/metrics/prometheus
    #   interval: 15s
  controlNamespace: logging
EOF

#
kubectl get services \
  -n logging
```

### Tips

#### Delete Old Pods

```sh
kubectl delete pod \
  -l app.kubernetes.io/name=fluentbit \
  -n logging
```

### Issues

#### Could not Write Forward Header

```log
default-logging-fluentbit-jl2hc fluent-bit [2021/09/10 13:11:26] [error] [output:forward:forward.0] could not write forward header
```

```yaml
apiVersion: logging.banzaicloud.io/v1beta1
kind: Logging
metadata:
  name: default-logging
spec:
  # ...
  fluentbit:
    # ...
    inputTail:
      Buffer_Chunk_Size: 1M
      Buffer_Max_Size: 5M
    # ...
  # ...
```

### Delete

```sh
helm uninstall logging-operator \
  -n logging
```
