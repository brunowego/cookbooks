# Azure Pipelines

<!--
azure-pipelines.yml

https://github.com/zc-hmcts/devops-coding-challenge/blob/main/azure-pipelines.yml
-->

## CLI

### Dependencies

- [Azure DevOps Configuration](/azure/services/azure-devops.md#configuration)

### Commands

```sh
az pipelines -h
```

### Usage

```sh
#
az pipelines list

#
az pipelines build list
```

<!--
#
az pipelines create --name '<name>' \
  --description '<description>' \
  --repository '<repository-url>' \
  --branch 'master' \
  --repository-type 'github' \
  --yml-path './pipelines.yml' \
  --service-connection '<service-connection>'
-->

#### Releases

```sh
#
az pipelines release list
```

#### Variables

```sh
#
az pipelines variable list --pipeline-name '<name>'
```

<!--
#
az pipelines variable create

#
az pipelines variable delete

#
az pipelines variable update
-->
