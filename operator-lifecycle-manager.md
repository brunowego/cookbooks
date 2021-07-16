# Operator Lifecycle Manager (OLM)

<!--
https://github.com/jsa4000/Observable-Distributed-System/blob/master/docs/01_operator_lifecycle_manager.md
-->

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

#
kubectl get pods -n olm
```
