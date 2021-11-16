# Redis Cluster

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/master/bitnami/redis-cluster#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns redis-cluster

#
helm install redis-cluster bitnami/redis-cluster \
  --namespace redis-cluster \
  --version 6.2.3 \
  -f <(cat << EOF
redis:
  configmap: |-
    maxmemory-policy allkeys-lfu
    maxmemory 4g

    appendonly yes

metrics:
  enabled: true
EOF
)
```

### Status

```sh
kubectl rollout status statefulset redis-cluster \
  -n redis-cluster
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=redis-cluster' \
  -n redis-cluster \
  -c redis-cluster \
  --max-log-requests 6 \
  -f
```

### Secret

```sh
kubectl get secret \
  --namespace redis-cluster \
  redis-cluster \
  -o jsonpath='{.data.redis-password}' | \
    base64 -d; echo
```

### Testing

```sh
#
kubectl port-forward svc/redis-cluster \
  -n redis-cluster \
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

### Delete

```sh
helm uninstall redis-cluster \
  -n redis-cluster

kubectl delete ns redis-cluster \
  --grace-period=0 \
  --force
```
