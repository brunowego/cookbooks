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
helm install log-generator banzaicloud-stable/log-generator \
  --namespace default
```

## Status

```sh
kubectl rollout status deploy/log-generator \
  -n default
```

## Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=log-generator' \
  -n default \
  -f
```

## Delete

```sh
helm uninstall log-generator \
  -n default
```
