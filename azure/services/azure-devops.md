# Azure DevOps

<!--
https://app.pluralsight.com/paths/skills/additional-devops-topics-on-microsoft-azure

https://linkedin.com/learning/react-js-building-an-interface-8551484/why-react-is-so-important
https://linkedin.com/learning/learning-azure-devops-10005641/use-azure-devops-to-enhance-application-development
https://linkedin.com/learning/visual-studio-tools-for-azure-devops/use-azure-devops-tools-from-the-visual-studio-ide
https://linkedin.com/learning/continuous-delivery-with-azure-devops/azure-devops-for-software-teams
https://linkedin.com/learning/azure-for-devops-application-infrastructure/the-need-for-agile-infrastructure
https://linkedin.com/learning/azure-devops-continuous-delivery-with-yaml-pipelines/devops-and-yaml-pipelines
https://linkedin.com/learning/azure-for-devops-implementing-development-processes/why-process-matters-in-devops
-->

## Links

- [Main Website](https://azure.microsoft.com/en-us/products/devops/)
- [Docs](https://learn.microsoft.com/en-us/cli/azure/devops?view=azure-cli-latest)

## Glossary

- System Development Life Cycle (SDLC)

## Services

- Azure Boards
- Azure Repos
- Azure Pipelines
- Azure Test Plans

## CLI

### Installation

```sh
az extension add -n azure-devops
```

### Commands

```sh
az devops -h
```

### Usage

```sh
az devops configure \
  --defaults \
    organization=https://dev.azure.com/<organization> \
    project=<ProjectName>
```

<!--
az pipelines create --name $name            \
  --description ''                          \
  --repository $repository                  \
  --branch master                           \
  --repository-type github                  \
  --yml-path .ci/azure-pipelines-v2.yml     \
  --service-connection $service_connection
-->
