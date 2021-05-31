# kubeseal

## CLI

### Installation

#### Homebrew

```sh
brew install kubeseal
```

### Usage

```sh
#
kubeseal \
  --format=yaml \
  --cert=[./key_file]

#
kubectl -n flux-system wait --for=condition=ready --timeout 5m helmreleases.helm.toolkit.fluxcd.io/sealed-secrets

#
kubeseal \
  --fetch-cert \
  --controller-name=sealed-secrets \
  --controller-namespace=flux-system \
  > [./path/to/pub-sealed-secrets.pem]
```
