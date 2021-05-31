# Kustomize

## Alternatives

- [Helm](/helm.md)

## CLI

### Installation

#### Homebrew

```sh
brew install kustomize
```

#### MacPorts

```sh
sudo port install kustomize
```

<!-- #### Unix-like

```sh
opsys=linux  # or darwin, or windows
curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest |\
  grep browser_download |\
  grep $opsys |\
  cut -d '"' -f 4 |\
  xargs curl -O -L
mv kustomize_*_${opsys}_amd64 kustomize
chmod u+x kustomize
``` -->

#### go get

```sh
go install sigs.k8s.io/kustomize/v3/cmd/kustomize
```

#### Chocolatey

```sh
choco install kustomize
```

### Usage

```sh
# Build
kustomize build [./app/overlays/production]

#
kustomize build [./app] | kubectl apply -f -
```

##

```sh
kubectl kustomize [./app]
```
