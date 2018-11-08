# Calico

## Cilium

```sh
sudo kubeadm init
```

### Vagrant

```sh
sudo kubeadm init --apiserver-advertise-address $(hostname -I | awk '{print $2}')
```

## Apply

```sh
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.4/examples/kubernetes/1.13/cilium.yaml
```

## Delete

```sh
kubectl delete -f https://raw.githubusercontent.com/cilium/cilium/v1.4/examples/kubernetes/1.13/cilium.yaml
```
