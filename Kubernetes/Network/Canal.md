# Canal

## Init

```sh
sudo kubeadm init \
  --pod-network-cidr=10.244.0.0/16
```

### Vagrant

```sh
sudo kubeadm init \
  --apiserver-advertise-address $(hostname -I | awk '{print $2}') \
  --pod-network-cidr=10.244.0.0/16
```

## Apply

```sh
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/canal.yaml
```

## Delete

```sh
kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
kubectl delete -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/canal.yaml
```
