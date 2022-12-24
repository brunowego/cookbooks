# PortSwigger Dastardly Pipeline

## Configuration

**Refer:** `./azure-pipelines.yml`

```yml
---
trigger:
  - main

pool:
  vmImage: ubuntu-latest

resources:
  - repo: self

variables:
  url_to_scan: https://google.com

stages:
  - stage: dast
    displayName: dast scanning
    jobs:
      - job: dast_dastardly
        displayName: dast dastardly scanning
        pool:
          vmImage: ubuntu-latest
        steps:
          - task: CmdLine@2
            displayName: Run DAST scan with dastardly
            inputs:
              script: |
                docker run --user $(id -u) --rm -v $(pwd):/dastardly -e \
                DASTARDLY_TARGET_URL=$(url_to_scan) -e \
                DASTARDLY_OUTPUT_FILE=/dastardly/dastardly-report.xml \
                public.ecr.aws/portswigger/dastardly:latest
                true
              failOnStderr: false
              workingDirectory: $(Build.SourcesDirectory)

          - task: PublishTestResults@2
            displayName: Publish Test Results
            inputs:
              testResultsFormat: JUnit
              testResultsFiles: '**/dastardly-report.xml'
```

<!--
Dastardly from Burp Suite Scan
-->
