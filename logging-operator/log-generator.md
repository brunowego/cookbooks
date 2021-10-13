# Log Generator

## References

- [Configuration](https://github.com/banzaicloud/logging-operator/tree/master/charts/logging-demo#configuration)

### Repository

```sh
helm repo add banzaicloud-stable 'https://kubernetes-charts.banzaicloud.com'
helm repo update
```

## Install

```sh
#
kubectl create ns my-app

#
helm install log-generator banzaicloud-stable/log-generator \
  --namespace my-app
```

## Status

```sh
kubectl rollout status deploy/log-generator \
  -n my-app
```

## Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=log-generator' \
  -n my-app \
  -f
```

## Delete

```sh
helm uninstall log-generator \
  -n my-app

kubectl delete ns my-app \
  --grace-period=0 \
  --force
```
