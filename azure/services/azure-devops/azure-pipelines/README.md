# Azure DevOps Pipelines

<!--
https://azuredevopslabs.com/labs/azuredevops/yaml/
-->

## Links

- [YAML schema reference for Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/?view=azure-pipelines)

## CLI

### Dependencies

- [Azure DevOps Configuration](/azure/services/azure-devops/README.md#configuration)

### Commands

```sh
az pipelines -h
```

<!-- ### Configuration

**Refer:** `./azure-pipelines.yml`

```yml

``` -->

### Usage

```sh
#
az repos list

#
az pipelines list --repository '<name>'

#
az pipelines create \
  --name '<name>' \
  --branch 'master' \
  --description '<description>' \
  --repository '<repository-url>' \
  --repository-type 'tfsgit' \
  --skip-first-run \
  --yml-path 'azure-pipelines.yml'

#
az pipelines show --id '<pipeline-id>'

#
az pipelines delete --id '<pipeline-id>'
```
