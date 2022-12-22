# kubectl-exec-as

## Links

- [Code Repository](https://github.com/jordanwilson230/kubectl-plugins/tree/krew#kubectl-exec-as)

## Installation

### Krew

```sh
kubectl krew install exec-as
```

## Commands

```sh
kubectl exec-as -h
```

## Usage

**Warning:** This only works in Kubernetes clusters which allow privileged containers.

<!--
kubectl get podsecuritypolicies
-->

```sh
#
kubectl exec-as \
  -u root \
  '[pod-name]' \
  -n '[namespace]' \
  -- /bin/bash
```
