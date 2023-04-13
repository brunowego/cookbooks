# Paralus

**Keywords:** Kubernetes Access Manager

## Links

- [Code Repository](https://github.com/paralus/paralus)
- [Main Website](https://paralus.io)
- [Docs](https://paralus.io/docs/)

<!--
https://www.paralus.io/docs/Installation/
-->

## CLI

### Installation

#### Darwin Binary

```sh
PCTL_VERSION="$(curl -s https://api.github.com/repos/paralus/cli/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/paralus/cli/releases/download/v${PCTL_VERSION}/pctl_${PCTL_VERSION}_darwin_amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        'pctl'
```

#### Linux Binary

```sh
PCTL_VERSION="$(curl -s https://api.github.com/repos/paralus/cli/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/paralus/cli/releases/download/v${PCTL_VERSION}/pctl_${PCTL_VERSION}_linux_amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        'pctl'
```

### Commands

```sh
pctl -h
```
