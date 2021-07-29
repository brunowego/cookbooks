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

### Delete

```sh
#
kubectl delete \
  -f 'https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml'
```

## Helm

### References

- [Values](https://github.com/sagikazarmark/helm-charts/tree/master/charts/rabbitmq-operator#values)

### Repository

```sh
helm repo add skm 'https://charts.sagikazarmark.dev'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
#
kubectl create namespace rabbitmq-system
```

```sh
helm install rabbitmq-operator skm/rabbitmq-operator \
  --namespace rabbitmq-system \
  --version 0.0.1 \
  -f <(cat << EOF
podMonitor:
  enabled: true

rabbitmq:
  serviceMonitor:
    enabled: true
EOF
)
```

### Status

```sh
kubectl rollout status deploy/rabbitmq-operator \
  -n rabbitmq-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=rabbitmq-operator' \
  -n rabbitmq-system \
  -f
```

### Metrics Exporter

```sh
#
kubectl port-forward \
  $(kubectl get pods -o jsonpath='{.items[0].metadata.name}' -l app.kubernetes.io/name=rabbitmq-operator -n rabbitmq-system) \
  -n rabbitmq-system \
  9782:9782

#
echo -e '[INFO]\thttp://127.0.0.1:9782/metrics'
```

### Delete

```sh
helm uninstall rabbitmq-operator \
  -n rabbitmq-system

kubectl delete namespace rabbitmq-system \
  --grace-period=0 \
  --force
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

## Cluster Creation

### Install

```sh
#
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
      prometheus.return_per_object_metrics = true
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

<!--
https://github.com/rabbitmq/rabbitmq-server/tree/master/deps/rabbitmq_prometheus
-->

```sh
#
export INGRESS_HOST='127.0.0.1'

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

### Secrets

| Login | Password |
| --- | --- |
| `admin` | `admin` |

<!-- ```sh
#
kubectl get secret rabbitmq-default-user \
  -o jsonpath='{.data.username}' \
  -n "$KUBECTL_NAMESPACE" | \
    base64 --decode; echo

kubectl get secret rabbitmq-default-user \
  -o jsonpath='{.data.password}' \
  -n "$KUBECTL_NAMESPACE" | \
    base64 --decode; echo
``` -->

### Ingress

```sh
echo -e "[INFO]\thttp://rabbitmq.${INGRESS_HOST}.nip.io"
```

### Metrics Exporter

```sh
#
kubectl port-forward \
  svc/rabbitmq \
  -n "$KUBECTL_NAMESPACE" \
  15692:15692

#
echo -e '[INFO]\thttp://127.0.0.1:15692/metrics'
```

### RabbitMQ Control

```sh
#
kubectl exec rabbitmq-server-0 \
  -n "$KUBECTL_NAMESPACE" \
  -- /bin/sh \
    -c 'rabbitmqctl cluster_status --formatter json' | \
      jq -r '.running_nodes'
```

### Delete

```sh
#
kubectl delete rabbitmqcluster rabbitmq \
  -n "$KUBECTL_NAMESPACE"

kubectl delete configmap rabbitmq-definitions \
  -n "$KUBECTL_NAMESPACE"

kubectl delete ingress rabbitmq \
  -n "$KUBECTL_NAMESPACE"

kubectl delete namespace "$KUBECTL_NAMESPACE"
```
