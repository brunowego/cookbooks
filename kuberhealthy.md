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

### Install

```sh
#
kubectl create ns kuberhealthy
```

```sh
helm install kuberhealthy kuberhealthy/kuberhealthy \
  --namespace kuberhealthy \
  --version 76
```

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade kuberhealthy kuberhealthy/kuberhealthy \
  --namespace kuberhealthy \
  -f <(yq m <(cat << EOF
prometheus:
  enabled: true

  serviceMonitor:
    enabled: true
EOF
) <(helm get values kuberhealthy --namespace kuberhealthy))
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

kubectl delete ns kuberhealthy \
  --grace-period=0 \
  --force
```
