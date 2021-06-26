# Argo Rollouts

**Keywords:** Progressive Delivery

## Alternatives

- [Flagger](/flagger.md)

## Links

- [Code Repository](https://github.com/argoproj/argo-rollouts)
- [Main Website](https://argoproj.github.io/argo-rollouts/)

<!--
Big Bang
-->

## Resources Manifest

### Install

```sh
#
kubectl create namespace argo-rollouts

#
kubectl apply \
  -n argo-rollouts \
  -f 'https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml'

#
kubectl wait \
  --namespace argo-rollouts \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/name=argo-rollouts \
  --timeout=90s
```

### Uninstall

```sh
#
kubectl delete \
  -n argo-rollouts \
  -f 'https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml'

#
kubectl delete namespace argo-rollouts
```

## CLI

### Installation

#### Homebrew

```sh
brew tap argoproj/tap
brew install kubectl-argo-rollouts
```

### Commands

```sh
kubectl argo rollouts -h
```

### Usage

```sh
#
kubectl argo rollouts \
  --namespace [namespace] \
  get rollout [name] \
  --watch

#
kubectl argo rollouts \
  --namespace [namespace] \
  promote [name]

# Do not run this command!
kubectl argo rollouts \
  --namespace [namespace] \
  abort [name]
```

### Tips

#### Canary Check

```sh
for i in {1..100}; do
  curl -s "http://[app-name].$ISTIO_HOST.nip.io" | \
    grep -i "[text]"
done | wc -l
```
