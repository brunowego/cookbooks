# kubectl-status

## Links

- [Code Repository](https://github.com/bergerx/kubectl-status)

## Installation

### Krew

```sh
kubectl krew install status
```

## Commands

```sh
kubectl status -h
```

## Usage

```sh
#
kubectl status nodes -A

#
kubectl status pods -A

#
kubectl status sts -A

#
kubectl status deployments -A

#
kubectl status replicasets -A

#
kubectl status services -A
```
