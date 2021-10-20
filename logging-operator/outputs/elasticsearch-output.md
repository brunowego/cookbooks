# Elasticsearch Output

## Links

- [Docs](https://banzaicloud.com/docs/one-eye/logging-operator/plugins/outputs/elasticsearch/)

## Dependencies

- Create [Elasticsearch](/elastic/elasticsearch.md#helm) in the `logging` namespace.

## Installation

```sh
#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: es-output
spec:
  elasticsearch:
    host: elasticsearch-master-headless
    port: 9200
    # scheme: https
    # ssl_verify: false
    # ssl_version: TLSv1_2
    # user: elastic
    # password:
    #   valueFrom:
    #     secretKeyRef:
    #       name: logging-es-elastic-user
    #       key: elastic
    buffer:
      timekey: 1m
      timekey_use_utc: true
      timekey_wait: 30s
EOF

#
kubectl get output \
  -n logging

#
cat << \EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: my-app-flow
spec:
  localOutputRefs:
  - es-output
  filters:
  - tag_normaliser: {}
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
curl "http://elasticsearch.${INGRESS_HOST}.nip.io/_cat/indices?v"

#
curl "http://elasticsearch.${INGRESS_HOST}.nip.io/_aliases?pretty=true"
```

## Issues

### Security Features

```log
default-logging-fluentd-0 fluentd warning: 299 Elasticsearch-7.14.0-dd5a0a2acaa2045ff9624f3729fc8a6f40835aa1 "Elasticsearch built-in security features are not enabled. Without authentication, your cluster could be accessible to anyone. See https://www.elastic.co/guide/en/elasticsearch/reference/7.14/security-minimal-setup.html to enable security.", 299 Elasticsearch-7.14.0-dd5a0a2acaa2045ff9624f3729fc8a6f40835aa1 "[types removal] Specifying types in bulk requests is deprecated."
```

TODO

## Delete

```sh
#
kubectl delete flow my-app-flow \
  -n logging

#
kubectl delete output es-output \
  -n logging
```
