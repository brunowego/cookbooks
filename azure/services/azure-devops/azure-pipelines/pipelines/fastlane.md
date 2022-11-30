# Fastlane Pipeline

<!--
https://github.com/Jamzady/simplistic_calculator/blob/main/azure-pipelines.yml

https://github.com/wireapp/wire-ios/blob/develop/fastlane/Fastfile
https://github.com/Automattic/pocket-casts-ios/blob/trunk/fastlane/Fastfile
-->

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

  - task: PublishBuildArtifacts@1
    displayName: Publish android artifacts
    inputs:
      PathtoPublish: build/app/outputs/flutter-apk
      ArtifactName: android
      publishLocation: Container
```
