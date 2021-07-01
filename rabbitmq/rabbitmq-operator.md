# RabbitMQ Operator

## Links

- [Code Repository](https://github.com/rabbitmq/cluster-operator/)
- [RabbitMQ Cluster Operator for Kubernetes](https://www.rabbitmq.com/kubernetes/operator/operator-overview.html)
- [RabbitMQ Cluster Operator Plugin for kubectl](https://www.rabbitmq.com/kubernetes/operator/kubectl-plugin.html)

## Resources Manifest

### Install

```sh
#
kubectl apply \
  -f 'https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml'
```

### Cluster Creation

```sh
#
cat << EOF | kubectl apply -f -
apiVersion: rabbitmq.com/v1beta1
kind: RabbitmqCluster
metadata:
  name: rabbitmq
spec:
  replicas: 3
  rabbitmq:
    additionalPlugins:
    - rabbitmq_management
    - rabbitmq_peer_discovery_k8s
    - rabbitmq_mqtt
    - rabbitmq_prometheus
    additionalConfig: |

EOF
```

<!--
# loopback_users.guest = false
mqtt.default_user = guest
mqtt.default_pass = guest
mqtt.listeners.tcp.default = 1883
mqtt.vhost = /
mqtt.exchange = amq.topic
# 24 hours by default
mqtt.subscription_ttl = 86400000
mqtt.prefetch = 10
vm_memory_high_watermark_paging_ratio = 0.99
disk_free_limit.relative = 1.0
cluster_partition_handling = ignore
-->

```sh
#
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: rabbitmq
spec:
  rules:
  - host: rabbitmq.${INGRESS_HOST}.nip.io
    http:
      paths:
      - backend:
          serviceName: rabbitmq
          servicePort: 15672
        path: /
EOF
```

```sh
#
kubectl get secret rabbitmq-default-user \
  -o jsonpath='{.data.username}' | \
    base64 --decode; echo

kubectl get secret rabbitmq-default-user \
  -o jsonpath='{.data.password}' | \
    base64 --decode; echo
```

```sh
#
kubectl get all \
  -l 'app.kubernetes.io/part-of=rabbitmq'

#
kubectl exec rabbitmq-server-0 -- /bin/sh \
  -c 'rabbitmqctl cluster_status --formatter json' | \
    jq -r '.running_nodes'
```

### Delete

```sh
kubectl delete \
  -f 'https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml'
```

## Krew

### Installation

```sh
kubectl krew install rabbitmq
```

### Commands

```sh
kubectl rabbitmq help
```

### Usage

```sh
#
kubectl rabbitmq install-cluster-operator

#
kubectl rabbitmq list

#
kubectl get customresourcedefinitions.apiextensions.k8s.io
```
