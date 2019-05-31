# Cert-Manager

##

```sh
kubectl create ns cert-manager
```

```sh
kubens cert-manager
```

##

```sh
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
```

```sh
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.7/deploy/manifests/cert-manager.yaml
```

## Helm

```sh
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.7/deploy/manifests/00-crds.yaml
```

```sh
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
```

```sh
helm repo add jetstack https://charts.jetstack.io
```

```sh
helm repo update
helm install \
  --name cert-manager \
  --version v0.7.0 \
  jetstack/cert-manager
```
