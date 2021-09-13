# Azure CLI

<!--
https://github.com/githubpartners/github-azure-microservices-blueprint
-->

## Links

- [Code Repository](https://github.com/Azure/azure-cli)

## References

- [Azure regions](https://azure.microsoft.com/en-us/global-infrastructure/regions/)

## CLI

### Installation

#### Homebrew

```sh
brew install azure-cli
```

### Commands

```sh
az -h
```

### Usage

```sh
# Login
az login

# Service Principal
az ad sp create-for-rbac \
  --role='Contributor' \
  --scopes="/subscriptions/$(az account list | jq -r '.[] | select (.isDefault == true).id')" | \
    jq

#
az login \
  --service-principal \
  -u [appId] \
  -p [password] \
  --tenant [tenant] | \
    jq

#
az group create \
  --name 'ExampleDevResourceGroup' \
  --location 'eastus'

#
az group list -o table
```

### Uninstall

```sh
#
brew uninstall azure-cli

#
rm -fR ~/.azure
```
