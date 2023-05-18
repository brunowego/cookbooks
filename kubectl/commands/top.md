# kubectl-top

## Alternatives

- [Lens (a.k.a. OpenLens)](/lens.md)

## Dependencies

- [Metrics Server](/metrics-server.md)

## Usage

```sh
#
kubectl get nodes --show-labels
kubectl top nodes -l <label>

#
kubectl top pods
kubectl top pods --containers

kubectl top pod '<pod-name>' \
  -n '<namespace>'
```

## Tips

### Filter

```sh
#
export POD_NAME='<pod-name>'

#
kubectl grep pods "$POD_NAME" --no-headers | \
  awk '{print $2}' | \
    xargs -n 1 command kubectl top pods --no-headers
```

## Issues

### Missing Metrics Server

```log
Error from server (NotFound): the server could not find the requested resource (get services http:heapster:)
```

```sh
#
kubectl describe apiservice v1beta1.metrics.k8s.io
```

Just install Metrics Server.
