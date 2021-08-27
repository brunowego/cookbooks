# Kubernetes Metrics Server

## Links

- [Code Repository](https://github.com/kubernetes-sigs/metrics-server)

## Kubernetes Manifest

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

- [Parameters](https://github.com/bitnami/charts/tree/master/bitnami/metrics-server#parameters)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
helm install metrics-server bitnami/metrics-server \
  --namespace kube-system \
  --version 5.9.2 \
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

### Delete

```sh
helm uninstall metrics-server \
  -n kube-system
```
