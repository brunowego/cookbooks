# cert-manager

## Helm

### References

- [Helm Charts](https://github.com/jetstack/cert-manager/tree/master/deploy/charts/cert-manager)

### Repository

```sh
helm repo add jetstack https://charts.jetstack.io
helm repo update
```

### Install

```sh
kubectl create namespace cert-manager
```

```sh
helm install cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.1.1 \
  --set installCRDs=true
```

### Status

```sh
kubectl rollout status deploy/cert-manager -n cert-manager
```

### Delete

```sh
helm uninstall cert-manager -n cert-manager

kubectl delete namespace cert-manager --grace-period=0 --force
```
