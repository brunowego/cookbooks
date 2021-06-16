# Kustomize

## Links

- [Main Website](https://kustomize.io/)

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

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.8.8/kustomize_v3.8.8_darwin_amd64.tar.gz' | \
    tar -xzC /usr/local/bin
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

### Commands

```sh
kustomize -h
```

### Usage

**Environments:** local, dev, qa, stg, prod.

```sh
# Create
kustomize create --resources ./base

# Preview base
kustomize build ./base

# Preview local
kustomize build ./overlays/local

# Apply
kustomize build ./overlays/local | \
  kubectl apply -f -

# Delete
kustomize build ./overlays/local | \
  kubectl delete -f -

# Show difference
diff <(kustomize build ./base) <(kustomize build ./overlays/local)
# or, using icdiff
icdiff <(kustomize build ./base) <(kustomize build ./overlays/local)
```
