# Weave Scope

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/weave-scope#configuration)

### Install

```sh
#
kubectl create ns weave-scope

#
kubectl create secret tls weave-scope.tls-secret \
  --cert='/etc/ssl/certs/weave-scope/root-ca.crt' \
  --key='/etc/ssl/private/weave-scope/root-ca.key' \
  -n weave-scope

#
helm install weave-scope stable/weave-scope \
  --namespace weave-scope \
  --set weave-scope-frontend.ingress.enabled=true \
  --set weave-scope-frontend.ingress.paths={/} \
  --set weave-scope-frontend.ingress.hosts={scope.${DOMAIN}} \
  --set 'weave-scope-frontend.ingress.tls[0].secretName=weave-scope.tls-secret' \
  --set 'weave-scope-frontend.ingress.tls[0].hosts={scope.${DOMAIN}}'
```

### Status

```sh
kubectl rollout status deploy/weave-scope-frontend-weave-scope \
  -n weave-scope
```

### Delete

```sh
helm uninstall weave-scope \
  -n weave-scope

kubectl delete ns weave-scope \
  --grace-period=0 \
  --force
```
