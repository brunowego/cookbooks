# Jaeger Operator

## Helm

### References

- [Configuration](https://github.com/jaegertracing/helm-charts/tree/main/charts/jaeger-operator#configuration)

### Repository

```sh
helm repo add jaegertracing 'https://jaegertracing.github.io/helm-charts'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
#
kubectl create namespace tracing
```

```sh
helm install jaeger-operator jaegertracing/jaeger-operator \
  --namespace tracing \
  --version 2.23.0
```

### Status

```sh
kubectl rollout status deploy/jaeger-operator \
  -n tracing
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=jaeger-operator' \
  -n tracing \
  -f
```

### Jaeger Instance

#### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
cat << EOF | kubectl apply \
  -n tracing \
  -f -
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: jaeger-all-in-one
  agent:
    strategy: DaemonSet
spec:
  ingress:
    hosts:
    - jaeger.${INGRESS_HOST}.nip.io
EOF
```

##### With ES

```sh
#
cat << EOF | kubectl apply \
  -n tracing \
  -f -
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: jaeger-all-in-one
spec:
  strategy: production
  storage:
    type: elasticsearch
    options:
      es:
        server-urls: http://elasticsearch.${INGRESS_HOST}.nip.io
        username: [username]
        password: [password]
  ingress:
    hosts:
    - jaeger.${INGRESS_HOST}.nip.io
EOF
```

#### Status

```sh
kubectl rollout status deploy/jaeger-all-in-one \
  -n tracing
```

#### Logs

```sh
kubectl logs \
  -l 'app=jaeger' \
  -n tracing \
  -f
```

#### Delete

```sh
kubectl delete jaeger jaeger-all-in-one \
  -n tracing
```

### Delete

```sh
helm uninstall jaeger-operator \
  -n tracing

kubectl delete namespace tracing \
  --grace-period=0 \
  --force
```
