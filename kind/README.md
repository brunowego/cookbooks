# Kubernetes in Docker (KinD)

<!--
https://github.com/kubernetes/kubeadm/tree/master/kinder
-->

## Links

- [Code Repository](https://github.com/kubernetes-sigs/kind)
- [Main Website](https://kind.sigs.k8s.io/)

## Guides

- [Ingress](https://kind.sigs.k8s.io/docs/user/ingress/)

## CLI

### Dependencies

- [Docker CE (Daemon)](/docker/docker-ce.md#daemon)
- [yq](/yq.md)

### Installation

#### Homebrew

```sh
brew install kind
```

#### go get

```sh
GO111MODULE='on' go get sigs.k8s.io/kind@v0.16.0
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
tee ~/.kind-config.yaml << EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
networking:
  apiServerAddress: 0.0.0.0
nodes:
- role: control-plane
  kubeadmConfigPatches:
  - |
    kind: InitConfiguration
    nodeRegistration:
      kubeletExtraArgs:
        node-labels: 'ingress-ready=true,kubernetes.io/os=linux'
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

### CNI

#### kindnet

Kind comes with kindnet by default.

#### Cilium 🌟

```sh
yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' ~/.kind-config.yaml <(cat << EOF
networking:
  disableDefaultCNI: true
  podSubnet: 10.10.0.0/16
  serviceSubnet: 10.11.0.0/16
EOF
) | sponge ~/.kind-config.yaml
```

**Installation:** [Cilium Networking](/kubernetes/cni/cilium.md#helm)

#### Calico

```sh
yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' ~/.kind-config.yaml <(cat << EOF
networking:
  disableDefaultCNI: true
  podSubnet: 192.168.0.0/16
EOF
) | sponge ~/.kind-config.yaml
```

#### Canal/Flannel

```sh
yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' ~/.kind-config.yaml <(cat << EOF
networking:
  disableDefaultCNI: true
  podSubnet: 10.244.0.0/16
EOF
) | sponge ~/.kind-config.yaml
```

### Environments

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Kubernetes Releases: https://kubernetes.io/releases/
export KUBERNETES_VERSION='1.24.3'
```

```sh
sudo su - "$USER"
```

### Bootstrap

**Observation:** [Check first](https://hub.docker.com/r/kindest/node/tags) if you have the image `kindest/node` with the tag corresponding to the version of Kubernetes.

```sh
# Create cluster
kind create cluster \
  --config ~/.kind-config.yaml \
  --image "docker.io/kindest/node:v$KUBERNETES_VERSION" \
  --name 'kind-default'

# Get installed version
kubectl version --short
```

#### Dependencies

- Ingress Controller
  - [NGINX](/kubernetes/ingress-controllers/ingress-nginx/README.md#helm)

### Usage

```sh
# Show clusters
kind get clusters

# Get nodes
kind get nodes \
  --name 'kind-default'
```

### Tips

#### External Docker

```sh
#
sed -i "s/0.0.0.0/$(docker context inspect --format '{{lower .Endpoints.docker.Host}}' | awk -F@ '{print $2}')/" ~/.kube/config

#
kubectl config set-cluster "$(kubectl config current-context)" \
  --insecure-skip-tls-verify=true
```

#### Cluster Info

```sh
# Get cluster info
kubectl cluster-info

# or, using KUBECONFIG environment variable
export KUBECONFIG="$(kind get kubeconfig --name 'kind-default')"
kubectl cluster-info

# or, using context parameter
kubectl cluster-info --context kind-default
```

#### Using Here document

```sh
#
cat << EOF | kind create cluster \
  --name 'kind-default' \
  --config -
# ...
EOF
```

### Issues

#### Port is Already Allocated

```log
docker: Error response from daemon: driver failed programming external connectivity on endpoint cilium-control-plane (62e7187ec0a8375f22adb9e83dbaa660d33a403e423f7d9aa333ba707615a9b3): Bind for 0.0.0.0:443 failed: port is already allocated.
```

```yaml
---
# ...
nodes:
  - role: control-plane
    # ...
    extraPortMappings:
      - containerPort: 80
        hostPort: 8080
        protocol: TCP
      - containerPort: 443
        hostPort: 8443
        protocol: TCP
# ...
```

### Delete

```sh
kind delete cluster \
  --name 'kind-default'
```
