# Hubble

## Links

- [Code Repository](https://github.com/cilium/hubble)

## CLI

### Installation

#### Homebrew

```sh
brew install hubble
```

### Commands

```sh
hubble -h
```

### Usage

```sh
#
hubble status

#
kubectl port-forward service/hubble-relay \
  --address 0.0.0.0 \
  --address :: 4245:80 \
  -n kube-system

hubble status --server localhost:4245
```
