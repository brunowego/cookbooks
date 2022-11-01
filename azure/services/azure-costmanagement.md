# Azure Cost Management

## CLI

### Installation

```sh
az extension add -n costmanagement
```

### Commands

```sh
az costmanagement -h
```

### Usage

```sh
#
az costmanagement query \
  --timeframe MonthToDate \
  --type Usage \
  --scope 'subscriptions/00000000-0000-0000-0000-000000000000'
```
