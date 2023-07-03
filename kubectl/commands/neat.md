# kubectl-neat

**Keywords:** Clean Up Output

## Links

- [Code Repository](https://github.com/itaysk/kubectl-neat)

## Installation

### Krew

```sh
kubectl krew install neat
```

## Commands

```sh
kubectl neat -h
```

## Usage

```sh
#
kubectl get pod '<pod-name>' \
  -n '<namespace>'
  -o yaml | \
    kubectl neat
```
