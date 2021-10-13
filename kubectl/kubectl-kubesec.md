# kubectl-kubesec

## Links

- [Code Repository](https://github.com/controlplaneio/kubectl-kubesec)
- [Main Website](https://kubesec.io/)

## CLI

### Installation

```sh
kubectl krew install kubesec-scan
```

### Commands

```sh
kubectl kubesec-scan -h
```

### Usage

```sh
#
kubectl kubesec-scan deployment coredns \
  -n kube-system
```
