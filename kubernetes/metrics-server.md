# Metrics Server

## Links

- [Code Repository](https://github.com/kubernetes-sigs/metrics-server)
- [Docs](https://kubernetes.io/docs/tasks/debug/debug-cluster/resource-metrics-pipeline/)

## minikube

### Installation

```sh
# Enable
minikube addons -p minikube enable metrics-server

# Disable
minikube addons -p minikube disable metrics-server
```

```sh
kubectl rollout status deploy/metrics-server \
  -n kube-system
```

## Custom Resource (CR)

### Install

```sh
# Fixed version
METRICS_SERVER_VERSION='0.4.1'
# or, latest
METRICS_SERVER_VERSION="$(curl -s https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; echo "$METRICS_SERVER_VERSION"

# Apply metrics server
kubectl apply \
  -f "https://github.com/kubernetes-sigs/metrics-server/releases/download/v${METRICS_SERVER_VERSION}/components.yaml"

# Apply patch to metrics server
kubectl patch deployment metrics-server \
  -n kube-system \
  -p '{"spec":{"template":{"spec":{"containers":[{"name":"metrics-server","args":["--cert-dir=/tmp", "--secure-port=4443","--kubelet-insecure-tls","--kubelet-preferred-address-types=InternalIP"]}]}}}}'
```

### Delete

```sh
kubectl delete \
  -f "https://github.com/kubernetes-sigs/metrics-server/releases/download/v${METRICS_SERVER_VERSION}/components.yaml"
```

## Helm

### References

- [Configuration](https://github.com/kubernetes-sigs/metrics-server/tree/master/charts/metrics-server#configuration)

### Repository

```sh
helm repo add metrics-server 'https://kubernetes-sigs.github.io/metrics-server'
helm repo update
```

### Install

```sh
#
kubens kube-system

#
helm search repo -l metrics-server/metrics-server

#
helm install metrics-server metrics-server/metrics-server \
  --version 3.11.0 \
  -f <(cat << EOF
defaultArgs:
  - --cert-dir=/tmp
  - --kubelet-insecure-tls=true
  - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
  - --kubelet-use-node-status-port
  - --metric-resolution=15s
EOF
)
```

### Status

```sh
kubectl rollout status deploy/metrics-server
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=metrics-server' \
  -f
```

### Testing

```sh
#
kubectl get \
  --raw '/apis/metrics.k8s.io/v1beta1/nodes' | \
    jq
```

### Tips

#### RBAC

```sh
kubectl auth can-i list pods.metrics.k8s.io -A
```

### Issues

#### Resource Already Exists

```log
Error: INSTALLATION FAILED: rendered manifests contain a resource that already exists. Unable to continue with install: ServiceAccount "metrics-server" in namespace "kube-system" exists and cannot be imported into the current release: invalid ownership metadata; label validation error: missing key "app.kubernetes.io/managed-by": must be set to "Helm"; annotation validation error: missing key "meta.helm.sh/release-name": must be set to "metrics-server"; annotation validation error: missing key "meta.helm.sh/release-namespace": must be set to "kube-system"
```

Need uninstall the current version before install another.

### Delete

```sh
helm uninstall metrics-server
```

## Issues

### TBD

```log
I0225 23:11:30.629823       1 server.go:187] "Failed probe" probe="metric-storage-ready" err="no metrics to serve"
```

TODO

### No Metrics

```log
metrics-server-7587f475f6-s8dwl metrics-server E1203 12:52:22.174613       1 reststorage.go:144] unable to fetch pod metrics for pod <my-company>/<my-app>-b68f4599zmrz: no metrics known for pod
```

TODO
