# Calico networking for Kubernetes

## Init

```sh
sudo kubeadm init --pod-network-cidr '192.168.0.0/16'
```

### Vagrant

```sh
sudo kubeadm init \
  --apiserver-advertise-address $(hostname -I | awk '{print $2}') \
  --pod-network-cidr '192.168.0.0/16'
```

## Apply

```sh
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
```

## Delete

```sh
kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
```
