# Helm

- [Reference](https://github.com/helm/charts/tree/master/stable/etcd-operator)

##

```sh
helm repo update
helm install stable/etcd-operator -n etcd-operator
```

## Test

```sh
kubectl get customresourcedefinitions
```
