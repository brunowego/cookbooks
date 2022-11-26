# dotNET Core

## Docs

- [Build, test, and deploy .NET Core apps](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/dotnet-core?view=azure-devops)

TODO

<!-- ## Structure

**Refer:** `./azure-pipelines.yml`

```yml
---
trigger:
  - main

pool:
  name: Windows

variables:
  buildConfiguration: Release

steps:
  - task: UseDotNet@2
    displayName: Use .NET Core sdk 6.0.100-preview
    inputs:
      packageType: sdk
      version: 6.0.100-preview.6.21355.2
      installationPath: $(Agent.ToolsDirectory)/dotnet

  - task: DotNetCoreCLI@2
    displayName: Install dotnet-stryker
    inputs:
      command: custom
      custom: tool
      arguments: update dotnet-stryker --tool-path $(Agent.BuildDirectory)/tools

  # - task: SonarQubePrepare@4
  #   inputs:
  #     SonarQube: SonarQube
  #     scannerMode: MSBuild
  #     projectKey: co.com.ceiba:blocknet6
  #     projectName: BlockNetSix
  #     extraProperties: |
  #       sonar.exclusions=Api/wwwroot/**

  - task: DotNetCoreCLI@2
    displayName: Build solution
    inputs:
      command: build
      projects: '**/*.sln'

  - task: DotNetCoreCLI@2
    displayName: Test solution
    inputs:
      command: test
      projects: '**/*[Tt]est*/*.csproj'
      arguments: --configuration $(BuildConfiguration)  --collect "Code Coverage"

  - task: Powershell@2
    displayName: Run dotnet-stryker
    inputs:
      workingDirectory: Domain.Tests
      targetType: inline
      script: $(Agent.BuildDirectory)/tools/dotnet-stryker
      arguments: --reporters "['html','json']"

  - task: PublishMutationReport@0
    displayName: Publish Mutation Test Report
    inputs:
      reportPattern: '**/mutation-report.html'

  # - task: SonarQubeAnalyze@4

  # - task: SonarQubePublish@4
  #   inputs:
  #     pollingTimeoutSec: '300'

  # - task: sonar-buildbreaker@8
  #   inputs:
  #     SonarQube: SonarQube

  - task: DotNetCoreCLI@2
    displayName: pack dotnet template for block
    inputs:
      command: pack
      packagesToPack: nuget.csproj

  - task: PublishBuildArtifacts@1
    displayName: Publish artifact
    inputs:
      PathtoPublish: $(Build.ArtifactStagingDirectory)
      ArtifactName: drop
      publishLocation: Container
``` -->
