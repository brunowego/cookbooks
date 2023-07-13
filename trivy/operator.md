# Trivy Operator

## Links

- [Code Repository](https://github.com/aquasecurity/trivy-operator)

## Lens

### Dependencies

- [Trivy Operator](#helm)

### Installation

1. Lens -> Extensions
2. Copy [TGZ URL Address of latest version](https://github.com/aquasecurity/trivy-operator-lens-extension/releases)
3. Extensions -> Paste in the Field URL -> Install

## Helm

### References

- [Helm Chart](https://github.com/aquasecurity/trivy-operator/tree/main/deploy/helm)

### Repository

```sh
helm repo add aquasecurity 'https://aquasecurity.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns trivy-system
# kubectl create ns security

#
helm search repo -l aquasecurity/trivy-operator

#
helm install trivy-operator aquasecurity/trivy-operator \
  --namespace trivy-system \
  --version 0.6.0

#
kubectl get all -n trivy-system
```

### Status

```sh
kubectl rollout status deployment/trivy-operator \
  -n trivy-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=trivy-operator' \
  -n trivy-system \
  -f
```

### Reports

```sh
#
kubectl get configauditreports -A -o wide

#
kubectl get vulnerabilityreports -A -o wide
```

### Delete

```sh
helm uninstall trivy-operator \
  -n trivy-system

kubectl delete ns trivy-system \
  --grace-period=0 \
  --force
```
