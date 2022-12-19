# SonarQube Java Plugin

## Links

- [Code Repository](https://github.com/SonarSource/sonar-java)

## Dependencies

- [SonarQube](/sonarsource/sonarqube-ce.md)
- [SonarQube Scanner](/sonarsource/sonarqube-scanner.md)

## Configuration

**Refer:** `./sonar-project.properties`

```properties
sonar.projectKey=com.example.app
sonar.projectName=My App Production

sonar.host.url=http://127.0.0.1:9000

sonar.sources=./src/main

sonar.language=java

sonar.java.binaries=./target/classes

sonar.sourceEncoding=UTF-8
sonar.dynamicAnalysis=reuseReports
```

<!--
sonar.tests=src/test/java

sonar.java.libraries=

sonar.core.codeCoveragePlugin=jacoco
sonar.coverage.jacoco.xmlReportPaths=app/build/reports/jacoco/testDevelopmentDebugUnitTestCoverage/testDevelopmentDebugUnitTestCoverage.xml
-->

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
