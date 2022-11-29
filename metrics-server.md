# Metrics Server

## Links

- [Code Repository](https://github.com/kubernetes-sigs/metrics-server)

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

## Minikube

### Addons

```sh
# Enable
minikube addons -p minikube enable metrics-server

# Disable
minikube addons -p minikube disable metrics-server
```

## Helm

### References

- [Helm Chart](https://github.com/bitnami/charts/tree/master/bitnami/metrics-server)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
helm install metrics-server bitnami/metrics-server \
  --namespace kube-system \
  --version 5.10.11 \
  -f <(cat << EOF
apiService:
  create: true

extraArgs:
  kubelet-insecure-tls: true
  kubelet-preferred-address-types: InternalIP
EOF
)
```

### Status

```sh
kubectl rollout status deploy/metrics-server \
  -n kube-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=metrics-server' \
  -n kube-system \
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
helm uninstall metrics-server \
  -n kube-system
```

## Issues

### No Metrics

```log
metrics-server-7587f475f6-s8dwl metrics-server E1203 12:52:22.174613       1 reststorage.go:144] unable to fetch pod metrics for pod [my-company]/[my-app]-b68f4599zmrz: no metrics known for pod
```

TODO
