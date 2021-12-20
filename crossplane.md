# Crossplane

**Keywords:** Multi-cloud Control Plane, GitOps-based, Infrastructure as Code

<!--
https://medium.com/containers-101/using-gitops-for-infrastructure-and-applications-with-crossplane-and-argo-cd-944b32dfb27e
https://www.youtube.com/watch?v=AtbS1u2j7po&t=159s

https://github.com/100daysofkubernetes/100DaysOfKubernetes/blob/main/src/templating/crossplane.md
https://github.com/stevendborrelli/spinnaker-crossplane/blob/main/README.md

https://github.com/upbound
https://github.com/upbound/universal-crossplane

https://github.com/datalayer-examples/crossplane-examples
https://github.com/datalayer-examples/flux-crossplane-example
https://blog.datalayer.io/2021/05/16/crossplane-by-example/
https://www.youtube.com/watch?v=Dw0SMLHZvXM
-->

## References

- [Crossplane Conformance Program](https://github.com/cncf/crossplane-conformance)

## Alternatives

- [Pulumi](/pulumi.md)
- [Terraform](/hashicorp/hashicorp-terraform.md)

## Guides

- [Documentation](https://crossplane.io/docs/master/)

## Helm

### Repository

```sh
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
```

### Install

```sh
kubectl create ns crossplane-system
```

```
helm install crossplane \
  --namespace crossplane-system \
  crossplane-stable/crossplane
```

```sh
helm list -n crossplane-system

kubectl get all -n crossplane-system
```

## CLI

### Installation

#### Unix-like

```sh
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/release-1.0/install.sh | sh
```

### Providers

#### AWS

```sh
kubectl crossplane install provider crossplane/provider-aws
```

#### Azure

```sh
kubectl crossplane install provider crossplane/provider-azure
```

#### Google Cloud

```sh
kubectl crossplane install provider crossplane/provider-gcp
```


