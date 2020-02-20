# Argo CI

## Helm

### Repository

```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo
```

### Install

```sh
kubectl create namespace argo-ci
```

```sh
helm install argo/argo-ci \
  -n argo-ci \
  --namespace argo-ci
```

```sh
kubectl rollout status deploy/argo-ci-apply-workflow-crd -n argo-ci
```

### Delete

```sh
helm delete argo-ci --purge
kubectl delete namespace argo-ci --grace-period=0 --force
```
