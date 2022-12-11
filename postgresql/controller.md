# PostgreSQL controller

## Links

- [Code Repository](https://github.com/max-rocket-internet/postgres-controller)

## Helm

**WIP:** Currently not working as expected.

### References

<!-- - [Configuration](https://github.com/max-rocket-internet/postgres-controller/tree/master/chart#configuration) -->

- [Values](https://github.com/deliveryhero/helm-charts/tree/master/stable/postgres-controller#values)

### Repository

```sh
helm repo add deliveryhero 'https://charts.deliveryhero.io'
helm repo update
```

### Install

```sh
#
kubectl create ns psql-system
# kubectl create ns database

#
helm search repo -l deliveryhero/postgres-controller

#
helm install postgres-controller deliveryhero/postgres-controller \
  --namespace psql-system \
  --version 1.2

#
kubectl get all -n psql-system
```

### Status

```sh
kubectl rollout status deployment/postgres-controller \
  -n psql-system
```

### Logs

```sh
kubectl logs \
  -l 'app=postgres-controller' \
  -n psql-system \
  -f
```

### Issues

### Delete

```sh
helm uninstall postgres-controller \
  -n psql-system

kubectl delete ns psql-system \
  --grace-period=0 \
  --force
```
