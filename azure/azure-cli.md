# Azure CLI

<!--
https://github.com/githubpartners/github-azure-microservices-blueprint
-->

## Links

- [Code Repository](https://github.com/Azure/azure-cli)

## References

- [Azure regions](https://azure.microsoft.com/en-us/global-infrastructure/regions/)

## CLI

### Installation

#### Homebrew

```sh
brew install azure-cli
```

### Commands

```sh
az -h
```

### Initialize

```sh
#
az extension add -n init

#
az init

#
cat ~/.azure/config
```

### Usage

```sh
#
az login
```

### Uninstall

```sh
#
brew uninstall azure-cli

#
rm -fR ~/.azure
```
