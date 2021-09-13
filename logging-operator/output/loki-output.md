# Loki

## Links

- [Docs](https://banzaicloud.com/docs/one-eye/logging-operator/plugins/outputs/loki/)
- [Grafana Dashboard](https://grafana.com/grafana/dashboards/12611)

## Dependencies

- Create [Grafana Loki](/grafana/loki/README.md#helm) in the `logging` namespace.

## Installation

```sh
#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: loki-output
spec:
  loki:
    url: http://loki-headless:3100
    buffer:
      chunk_limit_size: 5M
    configure_kubernetes_labels: true
    # drop_single_key: true
    # extra_labels:
    #   cluster: cluster-xxx
    # extract_kubernetes_labels: false
    # labels:
    #   namespace: ""
    #   pod: ""
    #   images: ""
    #   host: ""
    #   container: ""
    #   tream: ""
    # remove_keys:
    # - time
    # - kubernetes
    # - logtag
    # - docker
    # - metadata
EOF

#
kubectl get output \
  -n logging

#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: loki-flow
spec:
  localOutputRefs:
  - loki-output
  filters:
  - tag_normaliser: {}
      # format: ${namespace_name}.${pod_name}.${container_name}
  - parser:
      remove_key_name_field: true
      reserve_data: true
      parse:
        type: none
  match:
  - select: {}
EOF

#
kubectl get flow \
  -n logging
```

## Validation

```sh
#
kubectl run -it --rm \
  logcli \
  --image docker.io/grafana/logcli:main-236ed18-amd64 \
  --env LOKI_ADDR='http://loki-headless:3100' \
  --restart 'Never' \
  -n logging \
  -- labels
```

## Delete

```sh
#
kubectl delete flow loki-flow \
  -n logging

#
kubectl delete output loki-output \
  -n logging
```
