# Bookstack

## Helm

### Install

```sh
kubectl create ns bookstack
```

```sh
helm install bookstack stable/bookstack \
  --namespace bookstack \
  --set podSecurityPolicy.enabled=true \
  --set ingress.enabled=true \
  --set ingress.hosts={bookstack.${INGRESS_HOST}.nip.io}
```

| Login | Password |
| --- | --- |
| admin@admin.com | password |

### Delete

```sh
helm uninstall bookstack -n bookstack
kubectl delete ns bookstack --grace-period=0 --force
```
