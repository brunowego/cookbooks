# Advanced Vector Extensions (AVX)

## References

- [Troubleshooting](https://www.kubeflow.org/docs/other-guides/troubleshooting/)

## CLI

### Usage

```sh
# Darwin
sysctl -a | grep -ic avx

# Linux
grep -ic avx /proc/cpuinfo
```

## Kubernetes

### Running

```sh
kubectl run busybox -it --rm \
  --image 'docker.io/library/busybox:1.31' \
  # --limits 'cpu=500m,memory=1Gi' \
  --restart 'Never' \
  -- grep -ic avx /proc/cpuinfo
```
