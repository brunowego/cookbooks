# Redis

## Links

- [Main Webstite](https://kubedb.com/kubernetes/databases/run-and-manage-redis-on-kubernetes/)

## Configuration

```sh
#
kubectl get redisversions

#
kubectl get storageclasses

#
cat << EOF | kubectl apply -f -
---
apiVersion: kubedb.com/v1alpha2
kind: Redis
metadata:
  name: server
  # namespace: demo
spec:
  version: 7.0.10
  storageType: Durable
  storage:
    storageClassName: local-path
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 1Gi
  # terminationPolicy: DoNotTerminate
EOF

#
kubectl get redis
```
