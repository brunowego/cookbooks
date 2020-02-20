# Bookstack

## Helm

### Install

```sh
kubectl create namespace bookstack
```

```sh
helm install stable/bookstack \
  -n bookstack \
  --namespace bookstack \
  --set podSecurityPolicy.enabled=true \
  --set ingress.enabled=true \
  --set ingress.hosts={bookstack.$(minikube ip).nip.io}
```

| Login | Password |
| --- | --- |
| admin@admin.com | password |

### Delete

```sh
helm delete bookstack --purge
kubectl delete namespace bookstack --grace-period=0 --force
```
