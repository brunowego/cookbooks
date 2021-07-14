# RabbitMQ Operator

## Links

- [Code Repository](https://github.com/rabbitmq/cluster-operator/)
- [RabbitMQ Cluster Operator for Kubernetes](https://rabbitmq.com/kubernetes/operator/operator-overview.html)
- [RabbitMQ Cluster Operator Plugin for kubectl](https://rabbitmq.com/kubernetes/operator/kubectl-plugin.html)

## Kubernetes Manifest

### Install

```sh
#
kubectl apply \
  -f 'https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml'
```

### Cluster Creation

```sh
#
export INGRESS_HOST='127.0.0.1'
export KUBECTL_NAMESPACE='my-app'

#
kubectl create namespace "$KUBECTL_NAMESPACE"

#
cat << EOF | kubectl apply \
  -n "$KUBECTL_NAMESPACE" \
  -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: rabbitmq-definitions
data:
  definitions.json: |-
    {
      "users": [
        {
          "name": "admin",
          "password_hash": "x0ZYkUSXKmadb+IWuVh3mRd9HQRELGbqrS5HxuZ2uTd9DH9G",
          "hashing_algorithm": "rabbit_password_hashing_sha256",
          "tags": "administrator"
        }
      ],
      "vhosts": [
        {
          "name": "/"
        }
      ],
      "permissions": [
        {
          "user": "admin",
          "vhost": "/",
          "configure": ".*",
          "write": ".*",
          "read": ".*"
        }
      ]
    }
EOF

#
cat << EOF | kubectl apply \
  -n "$KUBECTL_NAMESPACE" \
  -f -
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
      load_definitions = /etc/rabbitmq/definitions.json
  override:
    statefulSet:
      spec:
        template:
          spec:
            containers:
            - name: rabbitmq
              volumeMounts:
              - mountPath: /etc/rabbitmq/definitions.json
                name: definitions
                subPath: definitions.json
            volumes:
            - name: definitions
              configMap:
                defaultMode: 420
                name: rabbitmq-definitions
EOF
```

```sh
#
cat << EOF | kubectl apply \
  -n "$KUBECTL_NAMESPACE" \
  -f -
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
echo -e "[INFO]\thttp://rabbitmq.${INGRESS_HOST}.nip.io"
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

<!-- ```sh
#
kubectl get secret rabbitmq-default-user \
  -o jsonpath='{.data.username}' | \
    base64 --decode; echo

kubectl get secret rabbitmq-default-user \
  -o jsonpath='{.data.password}' | \
    base64 --decode; echo
``` -->

### Metrics Exporter

```sh
#
kubectl port-forward \
  svc/rabbitmq \
  -n "$KUBECTL_NAMESPACE" \
  15692:15692

#
echo -e '[INFO]\thttp://127.0.0.1:15692/metrics'

#
kubectl port-forward \
  $(kubectl get pods -o jsonpath='{.items[0].metadata.name}' -l app.kubernetes.io/component=rabbitmq-operator -n rabbitmq-system) \
  -n rabbitmq-system \
  9782:9782

#
echo -e '[INFO]\thttp://127.0.0.1:9782/metrics'
```

### RabbitMQ Control

```sh
#
kubectl exec rabbitmq-server-0 -- /bin/sh \
  -c 'rabbitmqctl cluster_status --formatter json' | \
    jq -r '.running_nodes'
```

### Delete

```sh
#
kubectl delete rabbitmqclusters --all
kubectl delete configmap rabbitmq-definitions
kubectl delete ingress rabbitmq

#
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
