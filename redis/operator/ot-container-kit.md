# Redis Operator by Opstree Container Kit

## Links

- [Code Repository](https://github.com/ot-container-kit/redis-operator)

## Helm

### Repository

```sh
helm repo add ot-helm 'https://ot-container-kit.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns redis-operator && kubens redis-operator

#
helm search repo -l ot-helm/redis-operator

#
helm show values ot-helm/redis-operator \
  --version 0.15.9

#
helm install redis-operator ot-helm/redis-operator \
  --version 0.15.9
```

### Status

```sh
kubectl rollout status deploy/redis-operator
```

### Logs

```sh
kubectl logs \
  -l 'name=redis-operator' \
  -f
```

### Instance Manifest

```sh
cat << EOF | kubectl apply -f -
---
apiVersion: redis.redis.opstreelabs.in/v1beta2
kind: Redis
metadata:
  name: redis
spec:
  kubernetesConfig:
    image: quay.io/opstree/redis:v7.0.5
    imagePullPolicy: IfNotPresent
  storage:
    volumeClaimTemplate:
      spec:
        accessModes: [ReadWriteOnce]
        resources:
          requests:
            storage: 1Gi
EOF
```

<!--
redis://rfs-redis.<namespace>.svc:26379
-->

```sh
kubectl delete redis redis
```

### Delete

```sh
helm uninstall redis-operator

kubectl delete ns redis-operator \
  --grace-period=0 \
  --force
```
