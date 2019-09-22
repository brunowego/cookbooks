# CoreDNS

## Plugins

### References

- [Plugins](https://github.com/coredns/coredns/tree/master/plugin)

### etcd

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
        endpoint http://etcd-cluster.kube-system.svc.cluster.local:2379
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
kubectl run 'etcd-cluster-test' -it --rm \
  --image='quay.io/coreos/etcd' \
  --env='ETCDCTL_API=3' \
  --env='ETCDCTL_ENDPOINTS="http://etcd-cluster.kube-system.svc.cluster.local:2379"' \
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

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/coredns#configuration)

### Install

```sh
helm install stable/coredns \
  -n coredns \
  --namespace kube-system
```

### Status

```sh
kubectl rollout status deploy/coredns -n kube-system
```

### Logs

```sh
kubectl logs -l 'k8s-app=coredns' -n kube-system -f
```

### Delete

```sh
helm delete coredns --purge
```
