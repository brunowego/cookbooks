# PostgreSQL

## Links

- [Main Webstite](https://kubedb.com/kubernetes/databases/run-and-manage-postgres-on-kubernetes)

## Configuration

```yml
---
apiVersion: kubedb.com/v1alpha2
kind: Postgres
metadata:
  name: quick-postgres
  # namespace: demo
spec:
  storage:
    accessModes:
      - ReadWriteOnce
    resources:
      requests:
        storage: 1Gi
    # storageClassName: standard
  storageType: Durable
  terminationPolicy: DoNotTerminate
  version: '15.3'
```
