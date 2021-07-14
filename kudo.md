# Kubernetes Universal Declarative Operator (KUDO)

## Alternatives

- [Operator Lifecycle Manager (OLM)](/operator-lifecycle-manager.md)

## Links

- [Code Repository](https://github.com/kudobuilder/kudo)
- [Main Website](https://kudo.dev/)

## CLI

### Installation

#### Homebrew

```sh
brew tap kudobuilder/tap
brew install kudo-cli
```

### Commands

```sh
kubectl kudo -h
```

### Usage

```sh
#
kubectl kudo init --wait

#
kubectl kudo install zookeeper
```
