# JavaScript Pipeline

## Docs

- [Quickstart - Use Azure Pipelines to build and publish a Node.js package](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/javascript?view=azure-devops&pivots=pipelines-yaml)

## Configuration

**Refer:** `./azure-pipelines.yml`

```yml
---
trigger:
  - main

pool:
  vmImage: ubuntu-latest

steps:
  # ...

  # TODO

  # ...
```
