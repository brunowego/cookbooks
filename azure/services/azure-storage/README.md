# Azure Storage

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
az storage fs file download \
  --account-name <name> \
  --file-system <container> \
  --path <path/to/filename> \
  --destination /dev/stdout
```
