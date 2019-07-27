# Polyaxon

## Helm

### Install

```sh
helm repo add polyaxon https://charts.polyaxon.com
helm repo update
```

```sh
kubectl create namespace polyaxon
```

```sh
helm install polyaxon/polyaxon \
  -n polyaxon \
  --namespace polyaxon \
  --set serviceType=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.hostName=polyaxon.example.com
```

```sh
kubectl rollout status deploy/polyaxon-polyaxon-api -n polyaxon
```

```sh
kubectl get secret polyaxon-polyaxon-secret -o jsonpath='{.data.POLYAXON_ADMIN_PASSWORD}' -n polyaxon | base64 --decode; echo
```

### Delete

```sh
helm delete polyaxon --purge
kubectl delete namespace polyaxon --grace-period=0 --force
```

## CLI

### Installation

#### PIP

```sh
pip install polyaxon-cli
```

### Commands

```sh
polyaxon --help
```
