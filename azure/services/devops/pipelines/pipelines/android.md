# Android Pipeline

## Docs

- [Build, test, & deploy Android apps](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/android?view=azure-devops)

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

  - task: JavaToolInstaller@0
    inputs:
      versionSpec: '11'
      jdkArchitectureOption: 'x64'
      jdkSourceOption: 'PreInstalled'

  - task: Gradle@3
    inputs:
      workingDirectory: ''
      gradleWrapperFile: 'gradlew'
      gradleOptions: '-Xmx3072m'
      publishJUnitResults: false
      testResultsFiles: '**/TEST-*.xml'
      tasks: 'assembleRelease'
      javaHomeOption: 'JDKVersion'
      jdkVersionOption: '1.11'
      # sonarQubeRunAnalysis: false
      # spotBugsAnalysis: false

  - task: AndroidSigning@3
    inputs:
      apkFiles: '**/*.apk'
      jarsign: true
      jarsignerKeystoreFile: 'keystore.jks'
      jarsignerKeystorePassword: '$(jarsignerKeystorePassword)'
      jarsignerKeystoreAlias: '$(keystoreAlias)'
      jarsignerKeyPassword: '$(jarsignerKeyPassword)'
      zipalign: true

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
