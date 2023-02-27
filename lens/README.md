# Lens (a.k.a. OpenLens)

<!--
https://www.youtube.com/watch?v=zW-E8THfvPY
-->

**Keyword:** Kubernetes Dashboard, IDE

## Links

- [Main Website](https://k8slens.dev/)
- [Code Repository](https://github.com/lensapp/lens)
- [Lens Extensions](https://github.com/lensapp/lens-extensions)

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

<!-- ### Extensions

```sh
#
ls ~/.k8slens/extensions
``` -->

### Tips

#### Debug Mode

```sh
# Darwin (macOS)
DEBUG=true /Applications/Lens.app/Contents/MacOS/Lens
```

#### Add to Hotbar

1. Home
2. Welcome to Lens! -> Browse Your Local Catalog
3. Catalog -> Categories -> Clusters
4. Clusters -> Cluster Name -> Add to Hotbar

### Issues

<!-- #### Missing Metrics

```log
Metrics not available at the moment
```

Install Prometheus Stack, Kube-State-Metrics (KSM) and Node Exporter. -->

#### TBD

```log
warn:    ┏ [METRICS-ROUTE]: failed to get metrics for clusterId=beabbe9cc34d9e909fc4b0c4db73a9ea: Metrics not available +150ms
warn:    ┃ [ 1] Error: Metrics not available
warn:    ┃ [ 2]     ...
warn:    ┃ [60] Cause: Error: socket hang up
warn:    ┃ [61]     ...
```

<!--
https://github.com/lensapp/lens/issues/5047#issuecomment-1073259845
-->

TODO

```sh
#
kubectl get --raw /metrics

#
kubectl proxy

#
curl \
  -X POST \
  'http://127.0.0.1:8001/api/v1/namespaces/lens-metrics/services/prometheus:80/proxy/api/v1/query_range' \
  --form 'query="sum (node_memory_MemTotal_bytes - (node_memory_MemFree_bytes + node_memory_Buffers_bytes + node_memory_Cached_bytes)) by (kubernetes_node)"' \
  --form 'start=1677418992' \
  --form 'end=1677422592' \
  --form 'step=60' | \
    jq
```

#### TBD

```log
Metrics are not available due to missing or invalid Prometheus configuration.
```

TODO
