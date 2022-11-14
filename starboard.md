# Starboard

## Links

- [Code Repository](https://github.com/aquasecurity/starboard)
- [Main Website](https://aquasecurity.github.io/starboard/)

## Lens

### Dependencies

- [Starboard Operator](#helm)

### Installation

1. Lens -> Extensions
2. Copy [TGZ URL Address of latest version](https://github.com/aquasecurity/starboard-lens-extension/releases)
3. Extensions -> Paste in the Field URL -> Install

## Helm

### Related

- [Starboard Lens Extension](https://github.com/aquasecurity/starboard-lens-extension)

### References

- [Helm Chart](https://github.com/aquasecurity/starboard/tree/main/deploy/helm)

### Repository

```sh
helm repo add aquasecurity 'https://aquasecurity.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns starboard-system
# kubectl create ns company-security

#
helm search repo -l aquasecurity/starboard-operator

#
helm install starboard-operator aquasecurity/starboard-operator \
  --namespace starboard-system \
  --version 0.10.10

#
helm status starboard-operator -n starboard-system

#
kubectl get all -n starboard-system
```

### Status

```sh
kubectl rollout status statefulset/sonarqube-sonarqube \
  -n starboard-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=starboard-operator' \
  -n starboard-system \
  -f
```

### Usage

```sh
#
kubectl get vulnerabilityreports -A -o wide

#
kubectl get configauditreports -A -o wide

#
kubectl get clustervulnerabilityreports -A -o wide

#
kubectl get clusterconfigauditreports -A -o wide

#
kubectl get ciskubebenchreports -o wide

#
kubectl get kubehunterreports -o wide
```

### Delete

```sh
helm uninstall aquasecurity/trivy-operator \
  -n starboard-system

kubectl delete ns starboard-system \
  --grace-period=0 \
  --force
```
