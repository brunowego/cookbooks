# Redis Operator by Spotahome

## Links

- [Code Repository](https://github.com/spotahome/redis-operator)

## Helm

### References

- [Values](https://github.com/spotahome/redis-operator/blob/master/charts/redisoperator/values.yaml)

### Repository

```sh
helm repo add redis-operator 'https://spotahome.github.io/redis-operator'
helm repo update
```

### Install

```sh
#
kubectl create ns redis-operator && kubens redis-operator

#
helm search repo -l redis-operator/redis-operator

#
helm show values redis-operator/redis-operator \
  --version 3.2.9

#
helm install redis-operator redis-operator/redis-operator \
  --version 3.2.9
```

### Status

```sh
kubectl rollout status deploy/redis-operator
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=redis-operator' \
  -f
```

### Instance Manifest

<!-- ```sh
# echo -n "pass" > password

# kubectl create secret generic redis-auth --from-file=password

  # auth:
  #   secretPath: redis-auth
``` -->

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: databases.spotahome.com/v1
kind: RedisFailover
metadata:
  name: redis
spec:
  sentinel:
    replicas: 1
  redis:
    replicas: 1
EOF
```

<!--
redis://rfs-redis.<namespace>.svc:26379
-->

```sh
kubectl delete redisfailover redis
```

### Delete

```sh
helm uninstall redis-operator

kubectl delete ns redis-operator \
  --grace-period=0 \
  --force
```
