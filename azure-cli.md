# Azure CLI

https://github.com/githubpartners/github-azure-microservices-blueprint

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

### Examples

#### Login

```sh
az login
```

#### Service Principal

```sh
az ad sp create-for-rbac \
  --role='Contributor' \
  --scopes="/subscriptions/$(az account list | jq -r '.[] | select (.isDefault == true).id')" | \
    jq
```

```sh
az login \
  --service-principal \
  -u [appId] \
  -p [password] \
  --tenant [tenant] | \
    jq
```

####

```sh
az group create \
  --name 'ExampleDevResourceGroup' \
  --location 'eastus'
```

```sh
az group list -o table
```

### Uninstall

```sh
rm -fR ~/.azure
```
