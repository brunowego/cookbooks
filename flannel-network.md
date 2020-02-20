# flannel networking for Kubernetes

## Init

```sh
sudo kubeadm init --pod-network-cidr '10.244.0.0/16'
```

### Vagrant

```sh
sudo kubeadm init \
  --apiserver-advertise-address $(hostname -I | awk '{print $2}') \
  --pod-network-cidr '10.244.0.0/16'
```

## Apply

```sh
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml
```

### Vagrant

- [Troubleshooting](https://github.com/coreos/flannel/blob/master/Documentation/troubleshooting.md#vagrant)

```sh
kubectl patch daemonsets -n kube-system kube-flannel-ds-amd64 -p '{"spec":{"template":{"spec":{"containers":[{"name":"kube-flannel","args":["--ip-masq","--kube-subnet-mgr","--iface=eth1"]}]}}}}'
```

## Delete

```sh
kubectl delete -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml
```

```sh
sudo ip link delete flannel.1
```
