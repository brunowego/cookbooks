# SonarQube

## Links

- [Code Repository](https://github.com/SonarSource/sonar-scanner-vsts)
- [Marketplace](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarqube)

## Issues

### Missing Support for Branch Feature

```log
[SQ] Task failed with status FAILED, Error message: Current edition does not support branch feature
```

Install [SonarQube CE Branch Plugin](/sonarsource/sonarqube/sonarqube-ce/plugins/branch.md#docker)

### Mismatch String Type

```log
[error] The "path" argument must be of type string. Received type undefined
```

TODO

<!--
https://community.sonarsource.com/t/getting-an-error-in-the-azure-devops-pipeline-for-the-path-argument-must-be-of-type-string/64512/10
-->

### TBD

```log
ERROR: Error during SonarScanner execution
ERROR: You must define the following mandatory properties for 'Unknown': sonar.projectKey
ERROR:
ERROR: Re-run SonarScanner using the -X switch to enable full debug logging.
The process '/home/vsts/work/_tasks/SonarQubeAnalyze_6d01813a-9589-4b15-8491-8164aeb38055/5.8.0/sonar-scanner/bin/sonar-scanner' failed with exit code 2
```

TODO

### TBD

```log
ERROR: Invalid value of sonar.sources for <project-name>
ERROR: Error during SonarScanner execution
ERROR: The folder 'src' does not exist for '<project-name>' (base directory = /home/vsts/work/r1/a)
ERROR:
ERROR: Re-run SonarScanner using the -X switch to enable full debug logging.
The process '/home/vsts/work/_tasks/SonarQubeAnalyze_6d01813a-9589-4b15-8491-8164aeb38055/5.8.0/sonar-scanner/bin/sonar-scanner' failed with exit code 2
```

TODO
