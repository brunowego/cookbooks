# Istio

## Repository

```sh
helm repo add istio.io https://storage.googleapis.com/istio-release/releases/1.1.3/charts
helm update
```

## Namespace

```sh
kubectl create ns istio-system
```

```sh
kubens istio-system
```

## Install

###

```sh
helm repo update
helm install istio.io/istio-init -n istio-init
helm install istio.io/istio -n istio
```

### CNI

```sh
helm install istio.io/istio-init -n istio-init --set istio_cni.enabled=true
helm install istio.io/istio-cni -n istio-cni
helm install istio.io/istio -n istio \
  --set istio_cni.enabled=true \
  --set tracing.enabled=true \
  --set tracing.ingress.enabled=true \
  --set kiali.enabled=true \
  --set kiali.ingress.hosts='' \
  --set kiali.ingress.enabled=true \
  --set grafana.enabled=true \
  --set grafana.ingress.hosts=''
```

#### GKE

```sh
helm install istio.io/istio-cni --name istio-cni --set cniBinDir=/home/kubernetes/bin
```
