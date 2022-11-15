# Azure PostgreSQL

## Links

- [Dashboard / Servers](https://portal.azure.com/#view/HubsExtension/BrowseResource/resourceType/Microsoft.DBforPostgreSQL%2Fservers)

## CLI

### Commands

```sh
az postgres -h
```

### Usage

```sh
#
az postgres server list-skus -l 'eastus'

#
az resource list -o table | grep 'Microsoft.DBforPostgreSQL/servers'
```

<!--
#
az postgres server list
-->

### Issues

### Missing Client Ip Address

```log
FATAL: no pg_hba.conf entry for host "<my-ip>", user "<db-user>", database "<db-name>", SSL on
```

```sh
#
curl -s httpbin.org/ip | \
  jq -r '.origin'
```

1. Azure Database for PostgreSQL servers -> Select Database
2. Connection security -> Add current client IP address ( <my-ip> ) + Add 0.0.0.0 - 255.255.255.255 -> Save

<!-- ####

```log
Server Name: "<server-name>"): performing Update: servers.ServersClient#Update: Failure sending request: StatusCode=0 -- Original Error: Code="FeatureSwitchNotEnabled" Message="Requested feature is not enabled"
```

public_network_access_enabled -->
