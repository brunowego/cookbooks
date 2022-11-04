# kubectl-resource-capacity

**Keywords:** Kubernetes Resources

## Links

- [Code Repository](https://github.com/robscott/kube-capacity)

## CLI

### Installation

#### Krew

```sh
kubectl krew install resource-capacity
```

### Commands

```sh
kubectl resource-capacity -h
```

### Usage

```sh
#
kubectl resource-capacity
kubectl resource-capacity -o yaml

#
kubectl resource-capacity --sort cpu.limit
kubectl resource-capacity --sort cpu.request
kubectl resource-capacity --sort cpu.util

#
kubectl resource-capacity --sort mem.util
kubectl resource-capacity --sort mem.request
kubectl resource-capacity --sort mem.limit

#
kubectl resource-capacity --pods
kubectl resource-capacity --pods --util
kubectl resource-capacity --pods --util --sort cpu.util
kubectl resource-capacity --pods --util --sort cpu.util --containers

#
kubectl resource-capacity -n kube-system -p -c
kubectl resource-capacity -n kube-system --pods --containers

#
kubectl resource-capacity --available

#
kubectl get nodes --show-labels
kubectl resource-capacity --node-labels node.kubernetes.io/instance-type=<type>
```
