# Operator Lifecycle Manager (OLM)

## Alternatives

- [Kubernetes Universal Declarative Operator (KUDO)](/kudo.md)

## Links

- [Code Repository](https://github.com/operator-framework/operator-lifecycle-manager)
- [OperatorHub](https://operatorhub.io/)

## Kubernetes Manifests

### Install

```sh
#
kubectl apply \
  -f 'https://github.com/operator-framework/operator-lifecycle-manager/releases/download/0.18.2/crds.yaml'

kubectl apply \
  -f 'https://github.com/operator-framework/operator-lifecycle-manager/releases/download/0.18.2/olm.yaml'

#
kubectl get olm -A
```
