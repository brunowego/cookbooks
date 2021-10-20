# Logging Operator Logging

## Helm

### References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-operator-logging#configuration)

### Dependencies

- [Logging Operator](/logging-operator/README.md#helm)

### Install

```sh
#
helm install logging-operator-logging banzaicloud-stable/logging-operator-logging \
  --version 3.14.2 \
  -f <(cat << EOF
tls:
  enabled: false

controlNamespace: logging-system
EOF
)
```

> Wait! This process take a while.

### Status

```sh
kubectl rollout status statefulset/logging-operator-logging-fluentd \
  -n logging-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=fluentd' \
  -c fluentd \
  -n logging-system \
  -f
```

### List Loggings

```sh
#
kubectl get loggings

#
kubectl get logging-all -A
```

### Tips

#### Get Problems

```sh
kubectl get flow [name] \
  -o jsonpath='{.status.problems}' | \
    jq
```

#### Delete Old Pods

```sh
kubectl delete pod \
  -l 'app.kubernetes.io/name=fluentbit' \
  -n logging-system
```

### Delete

```sh
helm uninstall logging-operator-logging \
  -n logging-system
```

## Custom Resource (CR)

### Install

```sh
#
cat << EOF | kubectl apply \
  -n logging-system \
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
  controlNamespace: logging-system
EOF
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
