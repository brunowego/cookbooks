# SonarQube JavaScript/TypeScript/CSS Plugin

## Links

- [Code Repository](https://github.com/SonarSource/SonarJS)
- [Main Website](https://docs.sonarqube.org/9.6/analysis/languages/javascript/)

## Dependencies

- [SonarQube](/sonarsource/sonarqube/sonarqube-ce/README.md)
- [SonarQube Scanner](/sonarsource/sonarqube/sonarqube-scanner.md)

## Configuration

**Refer:** `./sonar-project.properties`

```properties
sonar.projectKey=com.example.app
sonar.projectName=My App Production

sonar.host.url=http://127.0.0.1:9000

sonar.sources=./src

sonar.language=ts

sonar.javascript.lcov.reportPaths=./coverage/lcov.info

sonar.sourceEncoding=UTF-8
sonar.dynamicAnalysis=reuseReports
```

```sh
#
export SONAR_LOGIN_TOKEN=''

#
echo '/.scannerwork' >> ./.gitignore

#
sonar-scanner \
  -Dproject.settings=./sonar-project.properties \
  -Dsonar.login="$SONAR_LOGIN_TOKEN" \
  -Dsonar.projectVersion="$(git branch --show-current)-$(git rev-parse --short HEAD)" \
  -Dsonar.branch.name="$(git branch --show-current)" \
  -X
```
