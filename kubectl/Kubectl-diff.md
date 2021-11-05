# kubectl-diff

## CLI

### Commands

```sh
kubectl diff -h
```

### Usage

```sh
#
kustomize build ./.k8s/overlays/local | \
  kubectl diff \
    -f -
```
