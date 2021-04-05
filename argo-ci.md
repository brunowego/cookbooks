# Argo CI

## Helm

### Repository

```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```

### Install

```sh
kubectl create namespace argo-ci
```

```sh
helm install argo-ci argo/argo-ci \
  --namespace argo-ci
```

```sh
kubectl rollout status deploy/argo-ci-apply-workflow-crd -n argo-ci
```

### Delete

```sh
helm uninstall argo-ci -n argo-ci
kubectl delete namespace argo-ci --grace-period=0 --force
```
