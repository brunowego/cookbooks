# etcd

## Helm

### References

- [Configuration](https://github.com/bitnami/charts/tree/master/bitnami/etcd#configuration)

### Repository

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm update
```

### Install

```sh
helm install bitnami/etcd \
  -n etcd-cluster \
  --namespace kube-system \
  --set statefulset.replicaCount=1 \
  --set auth.rbac.enabled=false \
  --set disasterRecovery.enabled=true \
  --set disasterRecovery.cronjob.schedule='*/5 * * * *' \
  --set disasterRecovery.pvc.storageClassName='standard'
```

### Status

```sh
kubectl rollout status statefulset/etcd-cluster -n kube-system
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=etcd' -n kube-system -f
```

### DNS

```sh
dig @10.96.0.10 etcd-cluster.kube-system.svc.cluster.local +short
nslookup etcd-cluster.kube-system.svc.cluster.local 10.96.0.10
```

### Test

```sh
kubectl run 'etcd-cluster-test' -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env='ETCDCTL_ENDPOINTS="http://etcd-cluster.kube-system.svc.cluster.local:2379"' \
  --namespace='kube-system' \
  --restart='Never' \
  -- /bin/sh
```

```sh
etcdctl put foo bar
etcdctl get foo
etcdctl del foo

exit
```

### Delete

```sh
helm delete etcd-cluster --purge

kubectl delete pvc -l 'app.kubernetes.io/name=etcd' -n kube-system
```
