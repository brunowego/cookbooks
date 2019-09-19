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
sed -i "s/example/$(kubectl config current-context)/" ./etcd-operator/example/example-etcd-cluster.yaml

kubectl create -f ./etcd-operator/example/example-etcd-cluster.yaml
```

### Logs

```sh
kubectl logs -l 'name=etcd-operator' -n kube-system -f
kubectl logs -l 'app=etcd' -n kube-system -f
```

### Check CRD

```sh
kubectl get customresourcedefinitions etcdclusters.etcd.database.coreos.com
```

### Test

```sh
kubectl run "$(kubectl config current-context)-etcd-cluster-test" -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env="ETCDCTL_ENDPOINTS=\"http://$(kubectl config current-context)-etcd-cluster-client:2379\"" \
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

### CoreDNS

#### Configuration

```sh
kubectl get configmap coredns -n kube-system -o yaml
```

```sh
yq w <(kubectl get configmap coredns -n kube-system -o yaml) data.Corefile "$(cat << EOF
$(kubectl get configmap coredns -n kube-system -o yaml | yq r - data.Corefile)
example.com {
    etcd example.com {
        stubzones
        path /skydns
        endpoint http://$(kubectl get service $(kubectl config current-context)-etcd-cluster-client -o jsonpath='{.spec.clusterIP}' -n kube-system):2379
    }
    errors
}
EOF
)" | kubectl apply -f -
```

#### Reload

```sh
kubectl delete pods -l 'k8s-app=kube-dns' -n kube-system
```

#### Logs

```sh
kubectl logs -l 'k8s-app=kube-dns' -n kube-system -f
```

#### Route

##### Vagrant

Enable routing from local machine (host) to the kubernetes pods/services/etc.

```sh
cat << EOF | sudo tee /etc/sysconfig/network-scripts/route-eth1
10.244.0.0/16 via $(hostname -I | awk '{print $2}') dev eth1
10.96.0.0/12 via $(hostname -I | awk '{print $2}') dev eth1
EOF
```

#### Test

```sh
kubectl run "$(kubectl config current-context)-etcd-cluster-test" -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env="ETCDCTL_ENDPOINTS=\"http://$(kubectl config current-context)-etcd-cluster-client:2379\"" \
  --namespace='kube-system' \
  --restart='Never' \
  -- /bin/sh
```

```sh
etcdctl member list

# A
etcdctl put /skydns/com/example/test '{"host":"10.194.11.253","ttl":10}'

# AAAA
etcdctl put /skydns/com/example/test '{"host":"1002::4:2","ttl":10}'

# CNAME
etcdctl put /skydns/com/example/test '{"host":"www.baidu.com","ttl":10}'

# SRV
etcdctl put /skydns/com/example/test '{"host":"10.194.11.253","port":5000,"ttl":10}'

# Delete
etcdctl del /skydns/com/example/test

exit
```

```sh
dig @10.96.0.10 A test.example.com +short
dig -t AAAA @10.96.0.10 test.example.com +short
dig -t CNAME @10.96.0.10 test.example.com +short
dig -t SRV @10.96.0.10 test.example.com +short
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
cat << EOF | kubectl apply -f -
apiVersion: etcd.database.coreos.com/v1beta2
kind: EtcdCluster
metadata:
  name: $(kubectl config current-context)-etcd-cluster
  namespace: kube-system
spec:
  size: 3
  version: 3.2.13
EOF
```

### Logs

```sh
kubectl logs -l "app=etcd-operator-$(kubectl config current-context)-etcd-operator" -n kube-system -f
kubectl logs -l 'app=etcd' -n kube-system -f
```

### Check CRD

```sh
kubectl get customresourcedefinitions etcdclusters.etcd.database.coreos.com
```

### Test

```sh
kubectl run "$(kubectl config current-context)-etcd-cluster-test" -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env="ETCDCTL_ENDPOINTS=\"http://$(kubectl config current-context)-etcd-cluster-client:2379\"" \
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

### CoreDNS

#### Configuration

```sh
kubectl get configmap coredns -n kube-system -o yaml
```

```sh
yq w <(kubectl get configmap coredns -n kube-system -o yaml) data.Corefile "$(cat << EOF
$(kubectl get configmap coredns -n kube-system -o yaml | yq r - data.Corefile)
example.com {
    etcd example.com {
        stubzones
        path /skydns
        endpoint http://$(kubectl get service $(kubectl config current-context)-etcd-cluster-client -o jsonpath='{.spec.clusterIP}' -n kube-system):2379
    }
    errors
}
EOF
)" | kubectl apply -f -
```

#### Reload

```sh
kubectl delete pods -l 'k8s-app=kube-dns' -n kube-system
```

#### Logs

```sh
kubectl logs -l 'k8s-app=kube-dns' -n kube-system -f
```

#### Route

##### Vagrant

Enable routing from local machine (host) to the kubernetes pods/services/etc.

```sh
cat << EOF | sudo tee /etc/sysconfig/network-scripts/route-eth1
10.244.0.0/16 via $(hostname -I | awk '{print $2}') dev eth1
10.96.0.0/12 via $(hostname -I | awk '{print $2}') dev eth1
EOF
```

#### Test

```sh
kubectl run "$(kubectl config current-context)-etcd-cluster-test" -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env="ETCDCTL_ENDPOINTS=\"http://$(kubectl config current-context)-etcd-cluster-client:2379\"" \
  --namespace='kube-system' \
  --restart='Never' \
  -- /bin/sh
```

```sh
etcdctl member list

# A
etcdctl put /skydns/com/example/test '{"host":"10.194.11.253","ttl":10}'

# AAAA
etcdctl put /skydns/com/example/test '{"host":"1002::4:2","ttl":10}'

# CNAME
etcdctl put /skydns/com/example/test '{"host":"www.baidu.com","ttl":10}'

# SRV
etcdctl put /skydns/com/example/test '{"host":"10.194.11.253","port":5000,"ttl":10}'

# Delete
etcdctl del /skydns/com/example/test

exit
```

```sh
dig @10.96.0.10 A test.example.com +short
dig -t AAAA @10.96.0.10 test.example.com +short
dig -t CNAME @10.96.0.10 test.example.com +short
dig -t SRV @10.96.0.10 test.example.com +short
```

### Delete

```sh
kubectl delete etcdcluster etcd-cluster -n kube-system

helm delete etcd-operator --purge
```
