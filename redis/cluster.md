# Redis Cluster

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/main/bitnami/redis-cluster#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns redis-system
# kubectl create ns session

#
helm search repo -l bitnami/redis-cluster

#
helm install redis-cluster bitnami/redis-cluster \
  --namespace redis-system \
  --version 8.3.1 \
  -f <(cat << EOF
cluster:
  nodes: 3

redis:
  configmap: |-
    maxmemory-policy allkeys-lfu
    maxmemory 4g

    appendonly yes

password: dev

metrics:
  enabled: true
EOF
)

#
kubectl get all -n redis-system
```

### Status

```sh
kubectl rollout status statefulset/redis-cluster \
  -n redis-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=redis-cluster' \
  -n redis-system \
  -c redis-cluster \
  --max-log-requests 6 \
  -f
```

### Secret

```sh
kubectl get secret \
  -n redis-system \
  redis-cluster \
  -o jsonpath='{.data.redis-password}' | \
    base64 -d; echo
```

### Testing

```sh
#
kubectl port-forward svc/redis-cluster \
  -n redis-system \
  6379:6379

#
redis-cli \
  -h 127.0.0.1 \
  -p 6379 \
  -a '[password]' \
  ping

#
redis-cli \
  -h 127.0.0.1 \
  -p 6379 \
  -a '[password]' \
  -c
```

<!-- ### Ingress

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply \
  -n "$K8S_NAMESPACE" \
  -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: redis
spec:
  rules:
  - host: redis.${DOMAIN}
    http:
      paths:
      - backend:
          serviceName: redis-cluster-headless
          servicePort: 6379
        path: /
EOF
``` -->

### Delete

```sh
helm uninstall redis-cluster \
  -n redis-system

kubectl delete ns redis-system \
  --grace-period=0 \
  --force
```
