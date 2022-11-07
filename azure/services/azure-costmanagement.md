# Azure Cost Management

## Tools

- [Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)

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
az consumption usage list \
  --subscription '<subscription-id>' \
  --billing-period-name 20220101
```

<!--
#
az consumption usage list \
  --billing-period-name $billing \
  --start-date $1 \
  --end-date $2 \
  -o table

#
az costmanagement query --type "ActualCost" --scope "subscriptions/${subscription}" --timeframe "Custom" --time-period from=${start_date}T00:00:00 to=${today}T00:00:00 --dataset-aggregation "{\"totalCost\":{\"name\":\"PreTaxCost\",\"function\":\"Sum\"}}" --output yaml

#
az costmanagement query \
  --timeframe MonthToDate \
  --type Usage \
  --scope 'subscriptions/00000000-0000-0000-0000-000000000000'
-->
