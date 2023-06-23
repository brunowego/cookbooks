# Kubernetes Gateway API

## Links

- [Code Repository](https://github.com/kubernetes-sigs/gateway-api)
- [Main Website](https://gateway-api.sigs.k8s.io)

## Kustomize

### Installation

```sh
kubectl kustomize 'https://github.com/kubernetes-sigs/gateway-api/config/crd?ref=v0.6.1' | kubectl apply -f -
```
