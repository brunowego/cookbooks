# kubectl-diff

## Dependencies

- [colordiff](/colordiff.md)

## Commands

```sh
kubectl diff -h
```

## Usage

```sh
#
export KUBECTL_EXTERNAL_DIFF='colordiff -N -u'

#
kustomize build ./.k8s/overlays/local | \
  kubectl diff \
    -f -
```
