# Advanced Vector Extensions (AVX)

## References

- [Troubleshooting](https://www.kubeflow.org/docs/other-guides/troubleshooting/)

## Info

### Darwin

```sh
sysctl -a | grep -ic avx
```

### Linux

```sh
grep -ic avx /proc/cpuinfo
```

### Kubernetes

```sh
kubectl run busybox -it --rm \
  --image='docker.io/library/busybox:1.31' \
  # --limits='cpu=500m,memory=1Gi' \
  --restart='Never' \
  -- grep -ic avx /proc/cpuinfo
```
