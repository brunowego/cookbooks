# Redis Cluster

## Helm

### References

- [Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/redis-cluster)

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

<!-- ### Ingress

```sh
#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply \
  -n "$KUBECTL_NAMESPACE" \
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
  -n redis-cluster

kubectl delete ns redis-cluster \
  --grace-period=0 \
  --force
```
