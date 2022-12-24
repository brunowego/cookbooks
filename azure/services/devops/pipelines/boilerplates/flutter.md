# Flutter Pipeline

<!--
https://github.com/Racso1624/AlChilazo/blob/main/azure-pipelines.yml

https://github.com/search?o=desc&q=filename%3Aazure-pipelines.yml+%22flutter%22+path%3A%2F+%22FlutterInstall%22&s=indexed&type=Code
-->

## Links

- [Code Repository](https://github.com/hey24sheep/azure-flutter-tasks)
- [Marketplace](https://marketplace.visualstudio.com/items?itemName=Hey24sheep.flutter)

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

  - task: FlutterInstall@0
    displayName: Install Flutter SDK
    inputs:
      mode: auto
      channel: stable
      version: latest

  - task: FlutterCommand@0
    displayName: Run Flutter diagnostics
    inputs:
      projectDirectory: '.'
      arguments: doctor -v

  - task: FlutterBuild@0
    displayName: Build application
    inputs:
      target: apk # web, windows, linux, aab, ipa
      projectDirectory: $(Build.SourcesDirectory)

  - task: FlutterTest@0
    displayName: Run unit tests
    inputs:
      generateCodeCoverageReport: true
      projectDirectory: $(Build.SourcesDirectory)

  # ...
```
