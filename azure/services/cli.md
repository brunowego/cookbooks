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

### Authenticate

**Notes:** Get [Directory ID](https://portal.azure.com/#settings/directory)

```sh
#
az login
# or, set Directory ID
az login \
  --allow-no-subscriptions \
  --tenant '<directory-id>'
```

### Issues

#### Missing Subscription

```log
(SubscriptionNotFound) The subscription '<UUID>' could not be found.
Code: SubscriptionNotFound
Message: The subscription '<UUID>' could not be found.
```

Make sure you have the [Azure Account](./account.md#usage) set up.

### Uninstall

```sh
#
brew uninstall azure-cli

#
rm -fR ~/.azure
```
