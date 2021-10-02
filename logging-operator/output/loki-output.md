# Loki

## Links

- [Docs](https://banzaicloud.com/docs/one-eye/logging-operator/plugins/outputs/loki/)
- [Grafana Dashboard](https://grafana.com/grafana/dashboards/12611)

## Dependencies

- Create [Grafana Loki](/grafana/loki/README.md#helm) in the `logging-system` namespace.
- [Log Generator](/logging-operator/log-generator.md#helm) for Demo

## Installation

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
      chunk_limit_size: 5M
      timekey: 1m
      timekey_wait: 30s
      timekey_use_utc: true
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
cat << EOF | kubectl apply \
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

## Validation

```sh
#
kubectl run -it --rm \
  logcli \
  --image docker.io/grafana/logcli:main-236ed18-amd64 \
  --env LOKI_ADDR='http://loki-headless:3100' \
  --restart 'Never' \
  -- labels
```

## Delete

```sh
#
kubectl delete flow loki-flow

#
kubectl delete output loki-output
```
