# Kafka Output

## Links

- [Docs](https://banzaicloud.com/docs/one-eye/logging-operator/plugins/outputs/kafka/)

## Dependencies

- Create [Apache Kafka](/kafka/README.md#helm) in the `logging` namespace.

## Installation

```sh
#
cat << EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: kafka-output
spec:
  kafka:
    brokers: kafka-headless:9092
    default_topic: topic
    format:
      type: json
    buffer:
      tags: topic
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
  name: kafka-flow
spec:
  localOutputRefs:
  - kafka-output
  filters:
  - tag_normaliser:
      format: ${namespace_name}.${pod_name}.${container_name}
  - parser:
      remove_key_name_field: true
      reserve_data: true
      parse:
        type: nginx
        # type: json
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
  kafka-consumer \
  --image docker.io/banzaicloud/kafka:2.13-2.4.0 \
  --restart Never \
  -n kafka \
  -- /opt/kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server kafka-headless:9092 \
    --topic topic \
    --from-beginning
```

## Delete

```sh
#
kubectl delete flow kafka-flow \
  -n logging

#
kubectl delete output kafka-output \
  -n logging
```
