# Azure Account

## Links

- [Directories + Subscriptions](https://portal.azure.com/#settings/directory)

## CLI

### Installation

```sh
az extension add -n account
```

### Commands

```sh
az account -h
```

### Usage

```sh
#
az account list-locations

#
az account list

#
az account set -s <subscription>

#
az account show

#
az account tenant list
```

#### Subscription

```sh
#
az account subscription cancel

#
az account subscription enable

#
az account subscription list

#
az account subscription list-location

#
az account subscription rename

#
az account subscription show
```
