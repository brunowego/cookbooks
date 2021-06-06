# Kubernetes Operations (kOps)

## Links

- [Code Repository](https://github.com/kubernetes/kops)
- [Main Website](https://kops.sigs.k8s.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install kops
```

#### Binary Linux

```sh
sudo curl \
  -L "https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64" \
  -o /usr/local/bin/kops && \
    sudo chmod +x /usr/local/bin/kops
```

### Commands

```sh
kops -h
```

### Usage

```sh
#
kops edit cluster

#
kops upgrade cluster kubernetes-cluster.example.com \
  --yes \
  --state=s3://kops-state-1234

#
kops validate cluster

#
kops rolling-update cluster $NAME
```
