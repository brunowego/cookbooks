# Locust

## Helm

### Install

```sh
kubectl create namespace locust
```

```sh
helm install stable/locust \
  -n locust \
  --namespace locust \
  --set service.type=ClusterIP
```

### Delete

```sh
helm delete locust --purge
kubectl delete namespace locust --grace-period=0 --force
```

## CLI

### Installation

#### PIP

```sh
pip install -U locustio
```

### Commands

```sh
locust -h
```
