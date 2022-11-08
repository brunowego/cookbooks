# Azure Storage

## Console

- [Storage browser](https://portal.azure.com/#view/Microsoft_Azure_Storage/StorageBrowserAccountPicker)

## Links

- [Docs](https://learn.microsoft.com/en-us/cli/azure/storage/blob?view=azure-cli-latest)

## CLI

### Commands

```sh
az storage -h
```

### Usage

```sh
#
az storage account list

#
az storage container list --account-name <name>

#
az storage blob list \
  --container-name '<name>' \
  --account-name '<name>'

#
az storage fs file download \
  --account-name '<name>' \
  --file-system '<container>' \
  --path '<path/to/filename>' \
  --destination /dev/stdout
```
