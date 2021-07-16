# kubectl-resource-capacity

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

#
kubectl resource-capacity --pods
kubectl resource-capacity --pods --util

#
kubectl resource-capacity --util --sort cpu.util

#
kubectl resource-capacity --available
```
