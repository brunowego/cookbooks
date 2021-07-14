# k3d

## Links

- [Main Website](https://k3d.io)

## CLI

### Installation

#### Homebrew

```sh
brew install k3d
```

### Commands

```sh
k3d -h
```

### Usage

```sh
#
k3d cluster delete mycluster || echo

#
k3d cluster create mycluster

#
k3d cluster create \
  --config <(cat << EOF
kind: Simple
apiVersion: k3d.io/v1alpha2
name: default
image: docker.io/rancher/k3s:v1.20.4-k3s1
EOF
)
```
