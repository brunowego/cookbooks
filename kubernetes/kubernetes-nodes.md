# Kubernetes Nodes

## CLI

### Usage

```sh
#
kubectl get nodes
kubectl get nodes -o wide
kubectl get nodes --show-labels
```

### Tips

#### Node Config Files

```sh
#
ls /etc/kubernetes

#
more /etc/kubernetes/scheduler.conf
kubectl config view \
  --kubeconfig /etc/kubernetes/scheduler.conf

#
kubectl get configmap \
  kube-proxy \
  -n kube-system \
  -o yaml
```

#### Node Certificates

```sh
#
ls -l /etc/kubernetes/pki

#
openssl x509 \
  -in /etc/kubernetes/pki/ca.crt \
  -text \
  -noout | \
    more
```

#### Resource Allocation

```sh
kubectl describe nodes | \
  grep -A 5 'Name:\|Allocated' | \
    grep 'Name\|memory'
```
