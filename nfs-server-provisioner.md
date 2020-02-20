# NFS Server Provisioner

TODO

<!-- ## Helm

### Install

```sh
kubectl create namespace nfs-server
```

```sh
helm install stable/nfs-server-provisioner \
  -n nfs-server-provisioner \
  --namespace nfs-server \
  --set persistence.enabled=true \
  --set persistence.size=40Gi \
  --set storageClass.defaultClass=true
```

### Status

```sh
kubectl rollout status deploy/nfs-server-provisioner -n nfs-server
```

### Delete

```sh
helm delete nfs-server-provisioner --purge
kubectl delete namespace nfs-server --grace-period=0 --force
``` -->
