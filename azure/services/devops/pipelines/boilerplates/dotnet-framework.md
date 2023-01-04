# .NET Framework Pipeline

## Docs

- [Build ASP.NET apps with .NET Framework](https://learn.microsoft.com/en-us/azure/devops/pipelines/apps/aspnet/build-aspnet-4?view=azure-devops)

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
