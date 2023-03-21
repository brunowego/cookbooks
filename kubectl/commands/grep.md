# kubectl-grep

## Links

- [Code Repository](https://github.com/guessi/kubectl-grep)

## Installation

```sh
kubectl krew install grep
```

## Commands

```sh
kubectl grep -h
```

## Usage

```sh
#
kubectl grep pods -A

#
kubectl grep pods -A apiserver
kubectl grep pods -A apiserver -o wide
```

## Tips

### Batch Deletion

```sh
kubectl grep pod <name> | \
  awk '{print $2}' | \
    xargs kubectl delete pod
```
