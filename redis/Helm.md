# Helm

## Namespace

```sh
kubectl create ns my-app
```

```sh
kubens my-app
```

## High Availability

- [Reference](https://github.com/helm/charts/tree/master/stable/redis-ha)

```sh
helm repo update
helm install stable/redis-ha -n redis --set replicas=2
```

###

```sh
helm upgrade redis stable/redis-ha --set replicas=3
```

### ISIO

```sh
kubectl label namespace my-app istio-injection=enabled
```

```sh
helm repo update
helm install stable/redis-ha -n redis \
  --set replicas=2 \
  --set securityContext.runAsUser=0 \
  --set securityContext.runAsNonRoot=false
```

## Simple

- [Reference](https://github.com/helm/charts/tree/master/stable/redis)

```sh
helm repo update
helm install stable/redis -n redis
```
