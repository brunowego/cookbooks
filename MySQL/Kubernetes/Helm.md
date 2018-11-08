# Helm

## Namespace

```sh
kubectl create ns my-app
```

```sh
kubens my-app
```

## Installation

```sh
helm repo update
helm install stable/mysql -n mysql
```
