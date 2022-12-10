# Datree

**Keywords:** Helm Plugin, Kubernetes Policy Management

## Links

- [Code Repository](https://github.com/datreeio/datree)
- [Main Website](https://datree.io/)

## Docs

- [Integrations](https://hub.datree.io/integrations)

## Helm Plugin

### Links

- [Code Repository](https://github.com/datreeio/helm-datree)

### Installation

```sh
helm plugin install 'https://github.com/datreeio/helm-datree'
```

### Commands

```sh
helm datree -h
```

### Usage

```sh
#
helm datree test <chart-directory> \
    -- \
        --values ./values.yaml \
        --set <parameter>=<value>
```

## CLI

### Installation

#### Homebrew

```sh
brew install datree
```

### Commands

```sh
datree -h
```

### Usage

```sh
#
datree test <./manifests>
```
