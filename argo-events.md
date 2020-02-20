# Argo Events

## Helm

### Repository

```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update argo
```

### Install

```sh
kubectl create namespace argo-events
```

```sh
helm install argo/argo-events \
  -n argo-events \
  --namespace argo-events
```

```sh
kubectl rollout status deploy/argo-events-gateway-controller -n argo-events
```

### Delete

```sh
helm delete argo-events --purge
kubectl delete namespace argo-events --grace-period=0 --force
```
