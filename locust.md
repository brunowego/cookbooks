# Locust

## Helm

### Install

```sh
kubectl create namespace locust
```

```sh
helm install locust stable/locust \
  --namespace locust \
  --set service.type=ClusterIP
```

### Delete

```sh
helm uninstall locust -n locust
kubectl delete namespace locust --grace-period=0 --force
```

## CLI

### Installation

#### PIP

```sh
pip3 install -U locustio
```

### Commands

```sh
locust -h
```
