# sig-storage-local-static-provisioner

TODO

## Helm

### References

- [Configurations](https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner/tree/master/helm#configurations)

### Repository

```sh
git clone https://github.com/kubernetes-sigs/sig-storage-local-static-provisioner.git sig-storage-local-static-provisioner && cd "$_"
```

### Install

```sh
helm install ./helm/provisioner \
  -n local-volume-provisioner \
  --namespace kube-system \
  --set 'classes[0].name=local-storage' \
  --set 'classes[0].hostDir=/mnt/disks' \
  --set 'classes[0].volumeMode=Filesystem' \
  --set 'classes[0].storageClass.isDefaultClass=true'
```

### Status

```sh
kubectl rollout status daemonset/local-volume-provisioner -n default
```

### Logs

```sh
kubectl logs -l 'app=local-volume-provisioner' -n default -f
```

### Delete

```sh
helm delete local-volume-provisioner --purge
```
