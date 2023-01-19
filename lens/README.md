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

### Extensions

```sh
#
ls ~/.k8slens/extensions
```

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

#### Missing Metrics

```log
Metrics not available at the moment
```

Install Prometheus Stack, Kube-State-Metrics (KSM) and Node Exporter.

#### TBD

```log
Metrics are not available due to missing or invalid Prometheus configuration.
```

```sh
kubectl logs \
  -l 'name=kube-state-metrics' \
  -n lens-metrics \
  -f

kubectl logs \
  -l 'name=node-exporter' \
  -n lens-metrics \
  -f

kubectl logs \
  -l 'name=prometheus' \
  -n lens-metrics \
  -f
```

```log
level=error ts=2022-12-23T10:34:50.063Z caller=klog.go:116 component=k8s_client_runtime func=ErrorDepth msg="pkg/mod/k8s.io/client-go@v0.21.0/tools/cache/reflector.go:167: Failed to watch *v1.Pod: failed to list *v1.Pod: pods is forbidden: User \"system:serviceaccount:lens-metrics:prometheus\" cannot list resource \"pods\" in API group \"\" in the namespace \"lens-metrics\""
```

```sh
#
cat << EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    app.kubernetes.io/created-by: resource-stack
    app.kubernetes.io/managed-by: Lens
    app.kubernetes.io/name: lens-metrics
  name: lens-prometheus
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: lens-prometheus
subjects:
- kind: ServiceAccount
  name: prometheus
  namespace: lens-metrics
EOF
```
