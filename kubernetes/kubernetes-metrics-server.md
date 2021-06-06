# Kubernetes Metrics Server

##

```sh
# Fixed version
METRICS_SERVER_VERSION='0.4.1'
# or, latest
METRICS_SERVER_VERSION="$(curl -s https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"

# Apply metrics server
kubectl apply \
  -f "https://github.com/kubernetes-sigs/metrics-server/releases/download/v${METRICS_SERVER_VERSION}/components.yaml"

# Apply patch to metrics server
kubectl patch deployment metrics-server \
  -n kube-system \
  -p '{"spec":{"template":{"spec":{"containers":[{"name":"metrics-server","args":["--cert-dir=/tmp", "--secure-port=4443","--kubelet-insecure-tls","--kubelet-preferred-address-types=InternalIP"]}]}}}}'

# Wait until available
kubectl wait \
  --timeout=60s \
  --for=condition=Available \
  -n kube-system \
  deployment/metrics-server

# Delete
kubectl delete \
  -f "https://github.com/kubernetes-sigs/metrics-server/releases/download/v${METRICS_SERVER_VERSION}/components.yaml"
```
