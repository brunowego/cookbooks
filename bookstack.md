# Bookstack

## Helm

### Install

```sh
#
kubectl create ns bookstack

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN='${KUBERNETES_IP}.nip.io'

#
helm install bookstack stable/bookstack \
  --namespace bookstack \
  --set podSecurityPolicy.enabled=true \
  --set ingress.enabled=true \
  --set ingress.hosts={bookstack.${DOMAIN}}
```

| Login | Password |
| --- | --- |
| admin@admin.com | password |

### Delete

```sh
helm uninstall bookstack \
  -n bookstack

kubectl delete ns bookstack \
  --grace-period=0 \
  --force
```
