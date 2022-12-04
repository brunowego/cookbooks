# Azure Command Line Interface (CLI)

## CLI

### Links

- [Code Repository](https://github.com/Azure/azure-cli)

### Installation

#### Homebrew

```sh
brew install azure-cli
```

#### Chocolatey

```sh
choco install azure-cli
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
az config get core.output
az config set defaults.location=eastus

#
cat ~/.azure/config
```

### Usage

```sh
#
az login
# or
az login --allow-no-subscriptions
# or
az login --tenant <id>
```

### Uninstall

```sh
#
brew uninstall azure-cli

#
rm -fR ~/.azure
```
