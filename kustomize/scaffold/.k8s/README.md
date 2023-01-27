# Kubernetes Manifests

## Dependencies

- [Kustomize](https://kustomize.io/)

## Usage

```sh
#
kubectl get configmap \
  -l 'com.example.app=name' \
  -o json | \
      jq '.items[] | .data'
```
