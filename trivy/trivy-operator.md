# Trivy Operator

<!--
https://github.com/aquasecurity/trivy-operator/blob/main/deploy/helm/values.yaml
https://github.com/Cloud-Native-Security/monitor-security/blob/3fd1ee081e559ccf236fbdb9d9d9035b35da86a5/README.md
https://github.com/aquasecurity/trivy-operator/blob/f2321ee2990224de225c00e139de62a61af41de1/docs/operator/installation/helm.md
https://github.com/aquasecurity/helm-charts/blob/676b006188f952074c59637fc3f7d7f6c2598079/README.md
https://github.com/abhishekmachagiri4/monitoring-security-prometheus-loki-grafana/blob/3fd1ee081e559ccf236fbdb9d9d9035b35da86a5/README.md
https://github.com/fjogeleit/trivy-operator-polr-adapter/blob/d1f294a2aaafc57dd023da6d9558cfb83a9f9704/README.md
-->

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
  --version 0.5.0 \
  -f <(cat << EOF
targetNamespaces:
EOF
)

#
kubectl get all -n trivy-system
```

### Status

```sh
kubectl rollout status statefulset/sonarqube-sonarqube \
  -n trivy-system
```

### Logs

```sh
kubectl logs \
  -l 'app=sonarqube' \
  -n trivy-system \
  -f
```

### Delete

```sh
helm uninstall aquasecurity/trivy-operator \
  -n trivy-system

kubectl delete ns trivy-system \
  --grace-period=0 \
  --force
```
