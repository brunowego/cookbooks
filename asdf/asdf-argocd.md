# asdf Argo CD

## Links

- [Code Repository](https://github.com/beardix/asdf-argocd)

## Dependencies

- Uninstall Pre-existing Versions of [Argo CD](/argo/argo-cd/README.md).

## Installation

```sh
asdf plugin-add argocd 'https://github.com/beardix/asdf-argocd.git'
```

## Usage

```sh
#
asdf list-all argocd

#
asdf install argocd <version>

#
asdf list argocd

#
asdf global argocd <version>

#
asdf reshim argocd <version>

#
argocd version --short
```

## Issues

### Another Installed Binary

```sh
#
where argocd
which argocd

#
brew uninstall \
  --ignore-dependencies \
  argocd
```
