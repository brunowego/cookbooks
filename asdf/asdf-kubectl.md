# asdf kubectl

## Links

- [Code Repository](https://github.com/asdf-community/asdf-kubectl)

## Dependencies

- Uninstall Pre-existing Versions of [Kubernetes Control (kubectl)](/kubectl/README.md).

## Installation

```sh
asdf plugin-add kubectl 'https://github.com/asdf-community/asdf-kubectl.git'
```

## Usage

```sh
#
asdf list-all kubectl

#
asdf install kubectl <version>

#
asdf list kubectl

#
asdf global kubectl <version>

#
asdf reshim kubectl <version>

#
kubectl version --short
```

## Issues

### ZSH Dump

```log
(eval):1: _kubectl: function definition file not found
```

```sh
rm ~/.zcompdump*
```

### Another Installed Binary

```sh
#
where kubectl
which kubectl

#
brew uninstall \
  --ignore-dependencies \
  kubernetes-cli
```
