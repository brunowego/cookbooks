# Outline

<!--
https://github.com/outline/outline/issues/1881

https://github.com/encircle360-oss/outline-helm-chart
-->

## Links

- [Code Repository](https://github.com/outline/outline)
- [Main Website](https://getoutline.com)
- [Download](https://getoutline.com/download)

## Helm

### Dependencies

- OpenID Connect (OIDC)
  [Dex IdP](/dex/README.md)

### References

- [Chart Repository](https://github.com/truecharts/charts/tree/master/charts/stable/outline)

### Repository

```sh
helm repo add truecharts 'https://charts.truecharts.org'
helm repo update
```

### Install

```sh
#
kubectl create ns outline
# kubectl create ns docs

#
kubens outline

#
helm search repo -l truecharts/outline

#
helm install outline truecharts/outline \
  --version 7.0.11
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  svc/outline \
  10196:10196
-->

### Status

```sh
kubectl rollout status deploy/outline
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=outline' \
  -f
```

### Delete

```sh
helm uninstall outline

kubectl delete ns outline \
  --grace-period=0 \
  --force
```
