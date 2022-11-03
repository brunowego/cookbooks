# Azure

<!--
https://app.pluralsight.com/paths/skills/managing-and-orchestrating-containers-with-azure-kubernetes-service-aks

https://app.pluralsight.com/paths/skills/managing-infrastructure-with-terraform

https://github.com/githubpartners/github-azure-microservices-blueprint
-->

## Links

- [Portal](https://portal.azure.com/)
- [All Services](https://portal.azure.com/#allservices)
- [Account](https://account.microsoft.com/)
- [Devices](https://account.microsoft.com/devices)
- [Regions](https://azure.microsoft.com/en-us/global-infrastructure/regions/)
- [Status Page](https://status.azure.com/)

## Glossary

- Team Foundation Version Control (TFVC)

## Azure Compute

- Virtual Machines
- App Services
- Containers
- Serverless

## CLI

### Links

- [Code Repository](https://github.com/Azure/azure-cli)

### Installation

#### Homebrew

```sh
brew install azure-cli
```

#### Chocolatey

```sh
choco install azure-cli
```

### Commands

```sh
az -h
```

### Initialize

```sh
#
az extension add -n init

#
az init

#
az config get core.output
az config set defaults.location=eastus

#
cat ~/.azure/config
```

### Usage

```sh
#
az login
# or
az login --allow-no-subscriptions
# or
az login --tenant <id>
```

### Uninstall

```sh
#
brew uninstall azure-cli

#
rm -fR ~/.azure
```

## Tips

### Visual Studio Code

```sh
code --install-extension ms-vscode.vscode-node-azure-pack
```

<!--
## Interview

https://www.youtube.com/watch?v=0eLRe5SMBPs
-->

<!--
<a href="https://dev.azure.com/yoginth/devparty/_build?definitionId=2">
  <img src="https://dev.azure.com/yoginth/devparty/_apis/build/status/devparty?branchName=main" alt="Azure DevOps CI">
</a>
-->
