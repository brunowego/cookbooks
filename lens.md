# Lens (a.k.a. OpenLens)

<!--
https://www.youtube.com/watch?v=zW-E8THfvPY
-->

## Links

- [Main Website](https://k8slens.dev/)
- [Code Repository](https://github.com/lensapp/lens)

## Alternatives

- [k9s](/k9s.md)
- [Kubernetes Dashboard](/kubernetes/kubernetes-dashboard.md)
- [Octant](/octant.md)

## App

### Installation

#### Homebrew

```sh
brew install --cask lens
```

#### Chocolatey

```sh
choco install -y lens
```

### Tips

#### Add to Hotbar

1. Home
2. Welcome to Lens! -> Browse Your Local Catalog
3. Catalog -> Categories -> Clusters
4. Clusters -> Cluster Name -> Add to Hotbar

#### Lens Metrics

1. Cluster -> Settings
2. Settings -> Extensions -> Lens Metrics

A namespace called `lens-metrics` will be created with the selected features enabled.

- Prometheus Stack
- Kube-State-Metrics (KSM)
- Node Exporter

### Issues

#### Missing Metrics

```log
Metrics not available at the moment
```

Install Prometheus Stack, Kube-State-Metrics (KSM) and Node Exporter.
