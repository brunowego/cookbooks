# Kubernetes IN Docker (kind)

## Links

- [Main Website](https://kind.sigs.k8s.io/)

## CLI

### Dependencies

- [Docker CE (Daemon)](/docker/docker-ce.md#daemon)

### Installation

#### Homebrew

```sh
brew install kind
```

#### go get

```sh
GO111MODULE='on' go get sigs.k8s.io/kind@v0.4.0
```

### Commands

```sh
kind -h
```

### Configuration

```sh
tee ~/.kind-config.yml << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
- role: worker
EOF
```

> More than one control-plane kind will automatically add a load-balancer.

### Bootstrap

```sh
# Create cluster
kind create cluster \
  --name default \
  --config ~/.kind-config.yml

# Get cluster info
kubectl cluster-info
# or, using KUBECONFIG environment variable
export KUBECONFIG="$(kind get kubeconfig --name 'default')"
kubectl cluster-info
# or, using context parameter
kubectl cluster-info --context kind-default

# Show clusters
kind get clusters

# Get nodes
kind get nodes --name 'default'

# Delete
kind delete cluster --name 'default'
```
