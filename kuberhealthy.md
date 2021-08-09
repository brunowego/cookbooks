# Kuberhealthy

## Links

- [Code Repository](https://github.com/kuberhealthy/kuberhealthy)

## Helm

### References

- [Helm Repository](https://github.com/kuberhealthy/kuberhealthy/tree/master/deploy/helm/kuberhealthy)

### Repository

```sh
helm repo add kuberhealthy 'https://kuberhealthy.github.io/kuberhealthy/helm-repos'
helm repo update
```

### Dependencies

- [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

### Install

```sh
#
kubectl create namespace kuberhealthy
```

```sh
helm install kuberhealthy kuberhealthy/kuberhealthy \
  --namespace kuberhealthy \
  --version 76 \
  -f <(cat << EOF
prometheus:
  enabled: true

  serviceMonitor:
    enabled: true
EOF
)
```

<!-- ### Status

```sh
kubectl rollout status deploy/kuberhealthy \
  -n kuberhealthy
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=kuberhealthy' \
  -n kuberhealthy \
  -f
``` -->

### Delete

```sh
helm uninstall kuberhealthy \
  -n kuberhealthy

kubectl delete namespace kuberhealthy \
  --grace-period=0 \
  --force
```
