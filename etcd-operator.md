# etcd Operator

## Git

### Install

```sh
git clone https://github.com/coreos/etcd-operator.git
```

```sh
./etcd-operator/example/rbac/create_role.sh --namespace=kube-system

yq w -i ./etcd-operator/example/deployment.yaml metadata.namespace kube-system

kubectl create -f ./etcd-operator/example/deployment.yaml
```

### Status

```sh
kubectl rollout status deploy/etcd-operator -n kube-system
```

### etcd Cluster

```sh
yq w -i ./etcd-operator/example/example-etcd-cluster.yaml metadata.namespace kube-system
sed -i 's/example-//' ./etcd-operator/example/example-etcd-cluster.yaml

kubectl create -f ./etcd-operator/example/example-etcd-cluster.yaml
```

### Logs

```sh
kubectl logs -l 'name=etcd-operator' -n kube-system -f
kubectl logs -l 'app=etcd' -n kube-system -f
```

### DNS

```sh
dig @10.96.0.10 etcd-cluster.kube-system.svc.cluster.local +short
nslookup etcd-cluster.kube-system.svc.cluster.local 10.96.0.10
```

### Test

```sh
kubectl run 'etcd-cluster-test' -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env='ETCDCTL_ENDPOINTS="http://etcd-cluster.kube-system.svc.cluster.local:2379"' \
  --namespace='kube-system' \
  --restart='Never' \
  -- /bin/sh
```

```sh
etcdctl put foo bar
etcdctl get foo
etcdctl del foo

exit
```

### Delete

```sh
kubectl delete -f ./etcd-operator/example/example-etcd-cluster.yaml
kubectl delete -f ./etcd-operator/example/deployment.yaml
```

```sh
rm -fR ./etcd-operator
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/etcd-operator#configuration)

### Install

```sh
helm install stable/etcd-operator \
  -n etcd-operator \
  --namespace kube-system \
  --set nameOverride="$(kubectl config current-context)"
```

### Status

```sh
kubectl rollout status deploy/etcd-operator-"$(kubectl config current-context)"-etcd-operator -n kube-system
```

### etcd Cluster

```sh
helm upgrade etcd-operator stable/etcd-operator -f <(yq m <(cat << EOF
customResources:
  createEtcdClusterCRD: true
  createBackupCRD: true
  createRestoreCRD: true
EOF
) <(helm get values etcd-operator))
```

### Logs

```sh
kubectl logs -l "app=etcd-operator-$(kubectl config current-context)-etcd-operator" -n kube-system -f
kubectl logs -l 'app=etcd' -n kube-system -f
```

### DNS

```sh
dig @10.96.0.10 etcd-cluster.kube-system.svc.cluster.local +short
nslookup etcd-cluster.kube-system.svc.cluster.local 10.96.0.10
```

### Test

```sh
kubectl run 'etcd-cluster-test' -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env='ETCDCTL_ENDPOINTS="http://etcd-cluster.kube-system.svc.cluster.local:2379"' \
  --namespace='kube-system' \
  --restart='Never' \
  -- /bin/sh
```

```sh
etcdctl put foo bar
etcdctl get foo
etcdctl del foo

exit
```

### Delete

```sh
helm delete etcd-operator --purge

kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("etcd.database.coreos.com")) | .metadata.name' | xargs kubectl delete crd
```
