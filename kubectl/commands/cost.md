# kubectl-cost

## Links

- [Code Repository](https://github.com/kubecost/kubectl-cost)

## Dependencies

- [Kubecost](/kubecost/README.md#helm)

## Installation

### Krew

```sh
kubectl krew install cost
```

## Commands

```sh
kubectl cost -h
```

## Usage

```sh
#
kubectl cost namespace \
  -N kubecost-system \
  -A
```

<!--
#
kubectl cost namespace --show-all-resources

#
kubectl cost namespace \
  --historical \
  --window 5d \
  --show-cpu \
  --show-memory \
  --show-efficiency=false

kubectl cost namespace -N kubecost-system --window 5d

#
kubectl cost namespace \
  -N kubecost-system \
  --historical \
  --window 5d \
  --show-cpu \
  --show-memory \
  --show-efficiency=false

#
kubectl cost controller -N kubecost-system --window 5d --show-pv

#
kubectl cost label -N kubecost-system --historical -l app

#
kubectl cost deployment -N kubecost-system --window month -A

#
kubectl cost deployment \
  -N kubecost-system \
  --window 3d \
  --show-cpu \
  -n kubecost

#
kubectl cost deployment \
  --window 3d \
  --show-cpu \
  -n kubecost \
  -N kubecost-staging \
  --service-name kubecost-staging-cost-analyzer

#
kubectl cost pod \
  --historical \
  --window yesterday \
  --show-cpu \
  -n kube-system

#
kubectl cost node \
  --historical \
  --window 7d \
  --show-cpu \
  --show-memory
-->
