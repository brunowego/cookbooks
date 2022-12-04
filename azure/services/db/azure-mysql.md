# Azure MySQL

## Console

- [Dashboard](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.DBforMySQL%2Fservers)

## CLI

### Commands

```sh
az mysql -h
```

### Usage

```sh
#
az mysql server list-skus -l 'eastus'

#
az mysql server list

#
az resource list -o table | grep 'Microsoft.DBforMySQL/servers'
```
