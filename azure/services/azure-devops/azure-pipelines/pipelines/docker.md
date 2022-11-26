# Docker

<!--
https://github.com/khlee97/lab-shop-pub-sub/blob/main/delivery/azure-pipelines.yml
-->

## Docs

- [Quickstart: Build a container image to deploy apps using Azure Pipelines](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/containers/build-image?view=azure-devops)

## Structure

**Refer:** `./azure-pipelines.yml`

```yml
---
trigger:
  - main

resources:
  - repo: self

variables:
  imageName: pipelines-javascript-docker

steps:
  - task: Docker@2
    displayName: Build an image
    inputs:
      repository: $(imageName)
      command: build
      Dockerfile: ./.devops/docker/Dockerfile
```
