# Kubernetes Reflector

## Links

- [Code Repository](https://github.com/emberstack/kubernetes-reflector)

## Helm

### References

- [Helm Repository](https://github.com/emberstack/kubernetes-reflector/tree/main/src/helm/reflector)

### Repository

```sh
helm repo add emberstack 'https://emberstack.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
helm install reflector emberstack/reflector \
  --namespace kube-system \
  --version 6.1.16 \
  -f <(cat << EOF
resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi
EOF
)
```

### Status

```sh
kubectl rollout status deploy/reflector \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=reflector' \
  -n kube-system \
  -f
```

### Delete

```sh
helm uninstall reflector \
  -n kube-system
```
