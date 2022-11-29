# Xcode Pipeline

<!--
https://github.com/search?o=desc&q=filename%3Aazure-pipelines.yml+path%3A%2F+%22Xcode%405%22&s=indexed&type=Code
-->

## Docs

- [Build, test, and deploy Xcode apps](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/xcode?view=azure-devops)

## Configuration

**Refer:** `./azure-pipelines.yml`

```yml
---
trigger:
  - main

pool:
  vmImage: macOS-latest

steps:
  # ...
  - task: Xcode@5
    inputs:
      actions: 'build'
      scheme: ''
      sdk: 'iphoneos'
      configuration: 'Release'
      xcWorkspacePath: '**/*.xcodeproj/project.xcworkspace'
      xcodeVersion: '14.1.0'
  # ...
```

<!--
- task: XamarinAndroid@1
  inputs:
    projectFile: '**/*droid*.csproj'
    outputDirectory: '$(outputDirectory)'
    configuration: '$(buildConfiguration)'
    msbuildVersionOption: '16.0'

- task: CopyFiles@2
  inputs:
    contents: '**/*.apk'
    targetFolder: '$(build.artifactStagingDirectory)'
- task: PublishBuildArtifacts@1
-->
