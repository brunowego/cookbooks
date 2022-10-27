# Calico Networking

## Links

- [Code Repository](https://github.com/projectcalico/cni-plugin)

## Guides

- [Docs](https://docs.projectcalico.org/getting-started/kubernetes/helm)

## Helm

### References

- [Chart Page](https://docs.projectcalico.org/getting-started/kubernetes/helm)

### Repository

```sh
helm repo add projectcalico 'https://docs.projectcalico.org/charts'
helm repo update
```

### Install

```sh
#
helm show values projectcalico/tigera-operator \
  --version v3.20.2

#
helm install calico projectcalico/tigera-operator \
  --version v3.20.2
```

### Delete

```sh
helm uninstall calico \
  -n calico-system
```

## Custom Resource (CR)

### Initialize

```sh
# Init
sudo kubeadm init --pod-network-cidr '192.168.0.0/16'

# Vagrant Fix
sudo kubeadm init \
  --apiserver-advertise-address $(hostname -I | awk '{print $2}') \
  --pod-network-cidr '192.168.0.0/16'
```

### Apply

```sh
#
kubectl apply -f 'https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml'

#
kubectl apply -f 'https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml'
```

### Delete

```sh
#
kubectl delete -f 'https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml'

#
kubectl delete -f 'https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml'
```
