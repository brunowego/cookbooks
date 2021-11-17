# Reloader

## Links

- [Code Respository](https://github.com/stakater/Reloader)
- [How to use Reloader](https://github.com/stakater/Reloader#how-to-use-reloader)

## Helm

### References

- [Helm Chart](https://github.com/stakater/Reloader/tree/master/deployments/kubernetes/chart/reloader)

### Repository

```sh
helm repo add stakater 'https://stakater.github.io/stakater-charts'
helm repo update
```

### Install

```sh
#
helm install reloader stakater/reloader \
  --namespace kube-system \
  --version v0.0.102 \
  -f <(cat << EOF
reloader:
  deployment:
    resources:
      limits:
        cpu: 100m
        memory: 512Mi
      requests:
        cpu: 10m
        memory: 128Mi
EOF
)
```

### Status

```sh
kubectl rollout status deploy/reloader-reloader \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app=reloader-reloader' \
  -n kube-system \
  -f
```

#### Annotations

```sh
# ConfigMap
kubectl annotate service [name] 'configmap.reloader.stakater.com/reload=[my-configmap]'

# Secret
kubectl annotate service [name] 'secret.reloader.stakater.com/reload=[my-secret]'
```

### Delete

```sh
helm uninstall reloader \
  -n kube-system
```
