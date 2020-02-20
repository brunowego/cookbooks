# Kubernetes IN Docker (kind)

## Installation

```sh
GO111MODULE='on' go get sigs.k8s.io/kind@v0.4.0
```

## Commands

```sh
kind -h
```

### Create Cluster

```sh
tee ~/.kind-config.yaml << EOF
kind: Cluster
apiVersion: kind.sigs.k8s.io/v1alpha3
networking:
  apiServerAddress: 127.0.0.1
nodes:
  - role: control-plane
  - role: worker
  - role: worker
EOF
```

> More than one control-plane kind will automatically add a load-balancer.

```sh
kind create cluster --config ~/.kind-config.yaml
```

```sh
export KUBECONFIG="$(kind get kubeconfig-path --name='kind')"
```

```sh
kubectl cluster-info
```

### Delete

```sh
kind delete cluster
unset KUBECONFIG
```
