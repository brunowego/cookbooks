# Kubernetes in Docker (kind)

<!--
https://github.com/kubernetes/kubeadm/tree/master/kinder
-->

## Links

- [Main Website](https://kind.sigs.k8s.io/)

## Guides

- [Ingress](https://kind.sigs.k8s.io/docs/user/ingress/)

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

#### Chocolatey

```sh
choco install kind
```

### Commands

```sh
kind -h
```

### Configuration

```sh
#
tee ~/.kind-config.yml << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: 'ingress-ready=true'
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
- role: worker
- role: worker
- role: worker
EOF

#
cat << EOF | kind create cluster \
  --name 'default' \
  --config -
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: 'ingress-ready=true'
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
  - containerPort: 443
    hostPort: 443
    protocol: TCP
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
  --name 'default' \
  --config ~/.kind-config.yml

#
export INGRESS_HOST='127.0.0.1'

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
kind get nodes \
  --name 'default'

# Delete
kind delete cluster \
  --name 'default'
```
