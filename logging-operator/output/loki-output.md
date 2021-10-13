# Grafana Loki

## Links

- [Docs](https://banzaicloud.com/docs/one-eye/logging-operator/plugins/outputs/loki/)
- [Grafana Dashboard](https://grafana.com/grafana/dashboards/12611)
- [Loki Output Plugin](https://banzaicloud.com/docs/one-eye/logging-operator/configuration/plugins/outputs/loki/)

## Dependencies

- Create [Grafana Loki](/grafana/loki/README.md#helm) in the `logging-system` namespace.
- [Log Generator](/logging-operator/log-generator.md#helm) for Demo

## Installation

### Namespace-wide

```sh
#
kubens [namespace]

#
cat << EOF | kubectl apply \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: loki-output
spec:
  loki:
    url: http://loki-headless.logging-system:3100
    buffer:
      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true
    configure_kubernetes_labels: true
EOF

#
kubectl get pods --show-labels

#
cat << \EOF | kubectl apply \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: loki-flow
spec:
  localOutputRefs:
  - loki-output
  filters:
  - tag_normaliser:
      format: ${namespace_name}.${pod_name}.${container_name}
  - parser:
      remove_key_name_field: true
      reserve_data: true
      parse:
        type: nginx
  match:
  - select:
      labels:
        app.kubernetes.io/name: log-generator
        app.kubernetes.io/instance: log-generator
EOF

#
kubectl get output
kubectl get flow
```

#### Delete

```sh
#
kubectl delete flow loki-flow
kubectl delete output loki-output
```

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
    url: http://loki-headless:3100
    buffer:
      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true
    configure_kubernetes_labels: true
EOF

#
kubectl get ns

#
cat << \EOF | kubectl apply \
  -n logging-system \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: ClusterFlow
metadata:
  name: loki-flow
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
        type: nginx
  match:
  - exclude:
      namespaces:
      - default
      - logging-system
  - select: {}
EOF

#
kubectl get clusteroutput,clusterflow \
  -n logging-system
```

#### Delete

```sh
#
kubectl delete clusterflow loki-flow \
  -n logging-system

#
kubectl delete clusteroutput loki-output \
  -n logging-system
```
