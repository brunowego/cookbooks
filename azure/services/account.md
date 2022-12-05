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
az account list --output table

#
az account set -s '<subscription>'
az account show

#
az account list-locations --output table
```

#### Tenants (Directory)

```sh
#
az account tenant list
```

#### Subscription

```sh
#
az account subscription list | jq -r '.[] | "Name: " + .displayName + ", ID: " + .subscriptionId'

#
az account subscription list-location \
  --output table \
  --id '<id>'

#
az account subscription enable --id '<id>'

#
az account subscription show --id '<id>'
```

<!--
#
az account subscription rename

#
az account subscription cancel
-->
