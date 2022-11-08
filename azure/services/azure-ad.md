# Azure Active Directory (AAD)

## Links

- [Dashboard / Users](https://portal.azure.com/#view/Microsoft_AAD_UsersAndTenants/UserManagementMenuBlade/~/AllUsers)

## CLI

### Commands

```sh
az ad -h
```

### Usage

```sh
#
az group list
```

<!--
#
az ad sp create-for-rbac \
  --role='Contributor' \
  --scopes="/subscriptions/$(az account list | jq -r '.[] | select (.isDefault == true).id')" | \
    jq

#
az login \
  --service-principal \
  -u <appId> \
  -p <password> \
  --tenant <tenant> | \
    jq

#
az group create \
  --name 'ExampleDevResourceGroup' \
  --location 'eastus'
-->