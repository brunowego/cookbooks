# NFS Client Provisioner

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/nfs-client-provisioner#configuration)

### Dependencies

- [Network File System (NFS)](/nfs.md)

### Install

```sh
kubectl create namespace nfs-client
```

```sh
showmount -e "$(hostname -I | awk '{print $2}')"
```

```sh
helm install stable/nfs-client-provisioner \
  -n nfs-client-provisioner \
  --namespace nfs-client \
  --set storageClass.name='standard' \
  --set storageClass.defaultClass=true \
  --set nfs.server="$(hostname -I | awk '{print $2}')" \
  --set nfs.path='/var/nfs/share' \
  --set nfs.mountOptions={vers=3}
```

> Scape with `"\'"[[ipv6]]"\'"` for IPv6.

### Status

```sh
kubectl rollout status deploy/nfs-client-provisioner -n nfs-client
```

### Logs

```sh
kubectl logs -l 'app=nfs-client-provisioner' -n nfs-client
```

### Delete

```sh
helm delete nfs-client-provisioner --purge
kubectl delete namespace nfs-client --grace-period=0 --force
```
