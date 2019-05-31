# Running

## Initialize

### Master

```sh
kubeadm config images pull -v 4
```

#### Network

Choose a [pod network add-on](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/#pod-network).

#### Node Join

```sh
sudo kubeadm token create --print-join-command
```
