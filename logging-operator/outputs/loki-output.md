# Grafana Loki

## Links

- [Docs](https://banzaicloud.com/docs/one-eye/logging-operator/plugins/outputs/loki/)
- [Grafana Dashboard](https://grafana.com/grafana/dashboards/12611)
- [Loki Output Plugin](https://banzaicloud.com/docs/one-eye/logging-operator/configuration/plugins/outputs/loki/)

## Dependencies

- Create [Grafana Loki](/grafana/loki/README.md#helm) in the `logging-system` namespace.

## Installation

### Cluster-wide

```sh
#
cat << EOF | kubectl apply \
  -n logging-system \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterOutput
metadata:
  name: loki-output
spec:
  loki:
    url: http://loki-write-headless.logging-system:3100
    buffer:
      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true
    configure_kubernetes_labels: true
EOF

#
kubectl get clusteroutput \
  -n logging-system

#
cat << \EOF | kubectl apply \
  -n logging-system \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterFlow
metadata:
  name: my-app-flow
spec:
  globalOutputRefs:
    - loki-output
  filters:
    - tag_normaliser:
        format: ${namespace_name}.${pod_name}.${container_name}
    - parser:
        remove_key_name_field: true
        reserve_data: true
        parse:
          type: none
  match:
    # - exclude:
    #     namespaces:
    #     - default
    #     - logging-system
    - select: {}
EOF

#
kubectl get clusterflow \
  -n logging-system
```

#### Delete

```sh
#
kubectl delete clusterflow my-app-flow \
  -n logging-system

#
kubectl delete clusteroutput loki-output \
  -n logging-system
```

### Namespace-wide

```sh
#
kubens 'default'

#
cat << EOF | kubectl apply \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: logging-demo-loki-output
spec:
  loki:
    url: http://loki-write-headless.logging-system:3100
    buffer:
      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true
    configure_kubernetes_labels: true
EOF

#
cat << \EOF | kubectl apply \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: logging-demo-flow
spec:
  localOutputRefs:
    - logging-demo-loki-output
  filters:
    - tag_normaliser:
        format: ${namespace_name}.${pod_name}.${container_name}
    - parser:
        remove_key_name_field: true
        reserve_data: true
        parse:
          type: none
  match:
    - select: {}
EOF

#
kubectl get output,flow

#
kubectl logs \
  -l 'app.kubernetes.io/component=write,app.kubernetes.io/instance=loki' \
  -n logging-system \
  -f
```

#### Delete

```sh
#
kubectl delete flow my-app-flow

kubectl delete output loki-output
```
