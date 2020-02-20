# Weave Scope

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/weave-scope#configuration)

### Install

```sh
kubectl create namespace weave-scope
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n weave-scope
```

```sh
helm install stable/weave-scope \
  -n weave-scope \
  --namespace weave-scope \
  --set weave-scope-frontend.ingress.enabled=true \
  --set weave-scope-frontend.ingress.paths={/} \
  --set weave-scope-frontend.ingress.hosts={scope.$(minikube ip).nip.io} \
  --set 'weave-scope-frontend.ingress.tls[0].secretName=example.tls-secret' \
  --set 'weave-scope-frontend.ingress.tls[0].hosts={scope.$(minikube ip).nip.io}'
```

### Status

```sh
kubectl rollout status deploy/weave-scope-frontend-weave-scope -n weave-scope
```

### Delete

```sh
helm delete weave-scope --purge
kubectl delete namespace weave-scope --grace-period=0 --force
```
