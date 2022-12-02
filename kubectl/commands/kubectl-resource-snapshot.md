# kubectl-resource-snapshot

## Links

- [Code Repository](https://github.com/fbrubbo/kubectl-snapshot)

## Installation

### Krew

```sh
kubectl krew install resource-snapshot
```

## Commands

```sh
kubectl resource-snapshot -h
```

## Usage

```sh
#
kubectl resource-snapshot

#
kubectl resource-snapshot -n [namespace]
kubectl resource-snapshot -d [deployment]
kubectl resource-snapshot -p [pod]

#
kubectl resource-snapshot \
  -csv-output resource-snapshot
```
