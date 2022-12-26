# Laravel Pipeline

<!--
https://github.com/1989car/vaop/blob/master/azure-pipelines.yml
https://github.com/marketredesign/mrd-auth0-laravel/blob/develop/azure-pipelines.yml
https://github.com/vptcoder/GroupBuy-CSIT321/blob/staging/azure-pipelines.yml
https://github.com/marketredesign/mrd-auth0-laravel/blob/develop/azure-pipelines.yml
-->

## Configuration

**Refer:** `./azure-pipelines.yml`

```yml
# yamllint disable rule:line-length
---
trigger:
  branches:
    include:
      - feature/*
      - fix/*
      - master
      - staging
      - develop

variables:
  # azureSubscription: subscription-id
  # webAppName: web-app-name
  vmImageName: ubuntu-22.04
  # environmentName: environment-name
  rootFolder: $(System.DefaultWorkingDirectory)

stages:
  - stage: Build
    displayName: Build stage
    variables:
      phpVersion: '8.1'
    jobs:
      - job: BuildJob
        pool:
          vmImage: $(vmImageName)
        steps:
          - script: |
              sudo update-alternatives --set php /usr/bin/php$(phpVersion)
              sudo update-alternatives --set phar /usr/bin/phar$(phpVersion)
              sudo update-alternatives --set phpdbg /usr/bin/phpdbg$(phpVersion)
              sudo update-alternatives --set php-cgi /usr/bin/php-cgi$(phpVersion)
              sudo update-alternatives --set phar.phar /usr/bin/phar.phar$(phpVersion)
              php -version
            workingDirectory: $(rootFolder)
            displayName: Use PHP version $(phpVersion)

          - script: composer install --no-interaction --prefer-dist
            workingDirectory: $(rootFolder)
            displayName: Composer install

          # - task: ArchiveFiles@2
          #   displayName: Archive files
          #   inputs:
          #     rootFolderOrFile: $(rootFolder)
          #     includeRootFolder: false
          #     archiveType: zip
          #     archiveFile: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
          #     replaceExistingArchive: true

          # - publish: $(Build.ArtifactStagingDirectory)/$(Build.BuildId).zip
          #   displayName: Upload package
          #   artifact: drop

  # - stage: Deploy
  #   displayName: Deploy Web App
  #   dependsOn: Build
  #   condition: succeeded()
  #   jobs:
  #     - deployment: DeploymentJob
  #       pool:
  #         vmImage: $(vmImageName)
  #       environment: $(environmentName)
  #       strategy:
  #         runOnce:
  #           deploy:
  #             steps:
  #               - task: AzureWebApp@1
  #                 displayName: Deploy Azure Web App
  #                 inputs:
  #                   azureSubscription: $(azureSubscription)
  #                   appName: $(webAppName)
  #                   package: $(Pipeline.Workspace)/drop/$(Build.BuildId).zip
```
