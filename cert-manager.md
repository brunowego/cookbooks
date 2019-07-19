# cert-manager

## Helm

### Install

```sh
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
```

```sh
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
```

```sh
helm repo add jetstack https://charts.jetstack.io
helm repo update
```

```sh
helm install \
  jetstack/cert-manager \
  -n cert-manager \
  --namespace cert-manager \
  --version v0.8.1
```

```sh
kubectl rollout status deploy/cert-manager -n cert-manager
```

### Delete

```sh
helm delete cert-manager --purge
kubectl delete namespace cert-manager --grace-period=0 --force
kubectl delete -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
```
