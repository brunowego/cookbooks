# Argo Events

## Links

- [Code Repository](https://github.com/argoproj/argo-events)

## Helm

### Repository

```sh
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```

### Install

```sh
kubectl create ns argo-events
```

```sh
helm install argo-events argo/argo-events \
  --namespace argo-events
```

```sh
kubectl rollout status deploy/argo-events-gateway-controller -n argo-events
```

### Delete

```sh
helm uninstall argo-events -n argo-events
kubectl delete ns argo-events --grace-period=0 --force
```
