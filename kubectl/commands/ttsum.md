# kubectl-ttsum

**Keywords:** Node Taint, Node Toleration

## Links

- [Code Repository](https://github.com/eytan-avisror/ttsum)

## Installation

### Krew

```sh
kubectl krew install ttsum
```

## Commands

```sh
kubectl ttsum -h
```

## Usage

```sh
#
kubectl ttsum taints

#
kubectl ttsum tolerations apps/v1 deployments -n <namespace>
```

<!--
kubectl ttsum taints --match 'app=db:NoSchedule'
-->
