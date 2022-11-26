# Maven

<!--
https://github.com/search?o=desc&q=filename%3Aazure-pipelines.yml+%22task%3A+Maven%22+%22task%3A+Cache%22&s=indexed&type=Code
-->

## Docs

- [Build Java apps](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/java?view=azure-devops)

<!-- ## Structure

**Refer:** `./azure-pipelines.yml`

```yml
---
trigger:
  - main

pool:
  vmImage: ubuntu-latest

variables:
  imageName: pipelines-javascript-docker

steps:
  - task: Maven@4
    inputs:
      mavenPomFile: pom.xml
      mavenOptions: -Xmx3072m
      javaHomeOption: JDKVersion
      jdkVersionOption: 1.8
      jdkArchitectureOption: x64
      publishJUnitResults: true
      testResultsFiles: '**/TEST-*.xml'
      goals: package
```

```yml
---
variables:
  MAVEN_CACHE_FOLDER: $(Pipeline.Workspace)/.m2/repository
  MAVEN_OPTS: -Dmaven.repo.local=$(MAVEN_CACHE_FOLDER)

steps:
  - task: Cache@2
    inputs:
      key: maven | "$(Agent.OS)" | **/pom.xml
      restoreKeys: |
        maven | "$(Agent.OS)"
        maven
      path: $(MAVEN_CACHE_FOLDER)
    displayName: Cache Maven local repo

  - task: Maven@3
    inputs:
      mavenPomFile: pom.xml
      mavenOptions: -Xmx3072m $(MAVEN_OPTS)
      javaHomeOption: JDKVersion
      jdkVersionOption: '1.8'
      jdkArchitectureOption: x64
      publishJUnitResults: true
      goals: clean package -Dmaven.test.skip=true

  - task: CopyFiles@2
    displayName: Copy Files
    inputs:
      Contents: |
        **
        !.git/**
      TargetFolder: $(Build.ArtifactStagingDirectory)

  - task: PublishBuildArtifacts@1
    inputs:
      PathtoPublish: $(Build.ArtifactStagingDirectory)
      ArtifactName: drop
      publishLocation: Container
``` -->
