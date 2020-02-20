# cert-manager

## Helm

### References

- [Helm Charts](https://github.com/jetstack/cert-manager/tree/master/deploy/charts/cert-manager)

### Repository

```sh
helm repo add jetstack https://charts.jetstack.io
helm repo update jetstack
```

### Install

```sh
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.10/deploy/manifests/00-crds.yaml
```

```sh
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation='true'
```

```sh
helm install jetstack/cert-manager \
  -n cert-manager \
  --namespace cert-manager
```

### Status

```sh
kubectl rollout status deploy/cert-manager -n cert-manager
```

### Delete

```sh
helm delete cert-manager --purge
kubectl delete namespace cert-manager --grace-period=0 --force
kubectl delete -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.10/deploy/manifests/00-crds.yaml
```
