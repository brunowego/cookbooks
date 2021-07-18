# kubectl-operator

## Links

- [Code Repository](https://github.com/operator-framework/kubectl-operator)

## Dependencies

- [Operator Lifecycle Manager (OLM)](/operator-lifecycle-manager.md)

## Installation

### Krew

```sh
kubectl krew install operator
```

## Commands

```sh
kubectl operator -h
```

## Usage

```sh
#
kubectl operator list-available

#
kubectl operator install [name] \
  -c stable \
  -v [version] \
  --create-operator-group
```

## Issues

### Missing OLM

```log
no matches for kind "PackageManifest" in version "packages.operators.coreos.com/v1"
```

Just install [Operator Lifecycle Manager (OLM)](/operator-lifecycle-manager.md).
