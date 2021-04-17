# Kuberentes Network

##

```sh
kubectl get nodes -o json | grep -i podCIDR
```

##

```sh
kubectl run busybox -it --rm \
  --image='docker.io/library/busybox:latest' \
  --restart='Never' \
  -- /bin/sh -c 'set'
```
