# kubectl-top

## Alternatives

- [Lens (a.k.a. OpenLens)](/lens.md)

## Dependencies

- [Kubernetes Metrics Server](/kubernetes/kubernetes-metrics-server.md)

## Usage

```sh
#
kubectl top nodes

#
kubectl top pods --containers

kubectl top pod '[pod-name]' \
  -n '[namespace]'
```

## Tips

### Filter

```sh
kubectl grep pods [pod-name] --no-headers | \
  awk '{print $2}' | \
    xargs -n 1 command kubectl top pods --no-headers
```

## Issues

### Missing Kubernetes Metrics Server

```log
Error from server (NotFound): the server could not find the requested resource (get services http:heapster:)
```

```sh
#
kubectl describe apiservice v1beta1.metrics.k8s.io
```

Install [Kubernetes Metrics Server](/kubernetes/kubernetes-metrics-server.md)
