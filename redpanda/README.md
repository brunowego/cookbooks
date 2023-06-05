# Redpanda

<!--
https://github.com/redpanda-data/documentation/blob/dev/docs/get-started/quick-start/kubernetes-qs-dev.mdx
-->

## Links

- [Code Repository](https://github.com/redpanda-data/redpanda)
- [Main Website](https://redpanda.com)

## Articles

- [Redpanda vs Kafka vs Confluent](https://confluent.io/redpanda-vs-kafka-vs-confluent/)

## CLI

### Installation

#### Homebrew

```sh
brew tap redpanda-data/tap
brew install redpanda
```

### Commands

```sh
rpk -h
rpk redpanda -h
```

<!-- ### Usage

```sh
#
rpk container start -n 3
rpk container stop

#
rpk redpanda start \
  --advertise-kafka-addr redpanda:9092 \
  --advertise-pandaproxy-addr redpanda:8082 \
  --check=false \
  --kafka-addr 0.0.0.0:9092 \
  --pandaproxy-addr 0.0.0.0:8082
``` -->

## Helm

### References

- [Configuration](https://github.com/redpanda-data/helm-charts/tree/main/charts/redpanda#configuration)

### Repository

```sh
helm repo add redpanda 'https://charts.redpanda.com/'
helm repo update
```

### Install

```sh
#
kubectl create ns redpanda
# kubectl create ns streaming

#
kubens redpanda

#
helm search repo -l redpanda/redpanda

#
helm install redpanda redpanda/redpanda \
  --version 2.5.2 \
  -f <(cat << EOF
statefulset:
  replicas: 1
EOF
)

#
kubectl get all
```

### Status

```sh
kubectl rollout status statefulset/redpanda
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=redpanda' \
  -f
```

### Usage

```sh
#
export REDPANDA_BROKERS='redpanda-0.redpanda.redpanda.svc.cluster.local.:9093'
# export REDPANDA_BROKERS='redpanda-0.redpanda.redpanda.svc.cluster.local.:9093,redpanda-1.redpanda.redpanda.svc.cluster.local.:9093,redpanda-2.redpanda.redpanda.svc.cluster.local.:9093'

#
kubectl get pod -o 'custom-columns=NODE:.spec.nodeName,NAME:.metadata.name' | \
  grep 'redpanda-[0-9]'

#
kubectl exec -it redpanda-0 -c redpanda -- \
  rpk cluster info \
    --brokers "$REDPANDA_BROKERS"

#
kubectl exec -it redpanda-0 -c redpanda -- \
  rpk topic create test-topic \
    --brokers "$REDPANDA_BROKERS"

#
kubectl exec -it redpanda-0 -c redpanda -- \
  rpk topic describe test-topic \
    --brokers "$REDPANDA_BROKERS"

#
kubectl exec -it redpanda-0 -c redpanda -- \
  rpk topic delete test-topic \
    --brokers "$REDPANDA_BROKERS"
```

### Delete

```sh
helm uninstall redpanda

kubens default

kubectl delete ns redpanda \
  --grace-period=0 \
  --force
```
