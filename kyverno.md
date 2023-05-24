# Kyverno

**Keywords:** Policy Management

## Links

- [Code Repository](https://github.com/kyverno/kyverno)
- [Main Website](https://kyverno.io)

## Helm

### References

- [Values](https://github.com/kyverno/kyverno/tree/main/charts/kyverno#values)

### Repository

```sh
helm repo add kyverno 'https://kyverno.github.io/kyverno'
helm repo update
```

### Install

```sh
#
kubectl create ns kyverno-system
# kubectl create ns security

#
helm search repo -l kyverno/kyverno

#
helm install kyverno kyverno/kyverno \
  --namespace kyverno-system \
  --version 2.6.1

#
kubectl get all -n kyverno-system
```

### Status

```sh
kubectl rollout status deployment/kyverno \
  -n kyverno-system
```

### Logs

```sh
kubectl logs \
  -l 'app=kyverno' \
  -n kyverno-system \
  -f
```

### Delete

```sh
helm uninstall kyverno \
  -n kyverno-system

kubectl delete ns kyverno-system \
  --grace-period=0 \
  --force
```
