# SonarQube Scanner

<!--
https://github.com/josephjsf2/josephjsf2.github.io/blob/b4780c2e99bd5b69b1d32ae3f8f7d9665360f758/_posts/others/2019/03/20/2019-03-20-SonarQube-1.md
https://github.com/Stashchenko/sonarqube/blob/dc356fb8550c1c8605ae49c5c10a2b0e53d105b4/sonar-analyze.sh
-->

## Links

- [Code Repository](https://github.com/SonarSource/sonar-scanner-cli)
- [Docs](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)

## CLI

### Links

- [Plugins](./plugins/README.md)

### Dependencies

- [SonarQube](/sonarsource/sonarqube-ce.md#docker)

#### Unix-like

- [GNU Wget](/gnu-wget.md)
- [UnZip](/unzip.md)

### Installation

#### Homebrew

```sh
brew install sonar-scanner
```

#### Unix-like

```sh
wget \
  -O /tmp/sonar-scanner-cli.zip \
  'https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472.zip'

( cd /tmp && unzip ./sonar-scanner-cli.zip -d /opt && rm ./sonar-scanner-cli.zip )

ln -s /opt/sonar-scanner-4.6.2.2472 /opt/sonar-scanner
```

### Environment

#### Unix-like

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# SonarQube Scanner
export PATH="/opt/sonar-scanner/bin:$PATH"
```

### Properties

```sh
# Darwin
export SONARQUBE_HOME="$(brew --cellar sonar-scanner)/$(brew info --json sonar-scanner | jq -r '.[0].installed[0].version')/libexec"

sed -i '/^#sonar.host.url=.*/ s/#//' "$SONARQUBE_HOME/conf/sonar-scanner.properties"
sed -i '/^#sonar.sourceEncoding=.*/ s/#//' "$SONARQUBE_HOME/conf/sonar-scanner.properties"
```

### Commands

```sh
sonar-scanner -h
```

### Configuration

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

1. Projects -> Manually
   - Display name: My App Production
   - Project key: com.example.app
   - Set Up
2. How do you want to analyze your repository? Locally
3. Analyze your project / Provide a token
   - Generate a token: my-app-token
   - Generate
   - Continue
4. Analyze your project

   - What is your project's main language?: Other (JS, TS, Go, Python, PHP, ...)
   - What is your OS?: macOS
   - Download and unzip the Scanner for macOS: Click Download
   - Execute the Scanner from your computer

   ```sh
   #
   export SONAR_LOGIN_TOKEN=''

   #
   sonar-scanner \
     -Dsonar.projectKey='com.example.app' \
     -Dsonar.projectName='My App Production' \
     -Dsonar.projectVersion='0.1.0' \
     -Dsonar.sources='./' \
     -Dsonar.exclusions='tests/**,vendor/**' \
     -Dsonar.language='php' \
     -Dsonar.php.coverage.reportPaths='./phpunit.coverage.xml' \
     -Dsonar.php.tests.reportPath='./phpunit.report.xml' \
     -Dsonar.host.url='http://127.0.0.1:9000' \
     -Dsonar.sourceEncoding='UTF-8' \
     -Dsonar.dynamicAnalysis='reuseReports' \
     -Dsonar.login="$SONAR_LOGIN_TOKEN" \
     -X
   ```

   **_Or_**

   ```sh
   #
   export SONAR_LOGIN_TOKEN=''

   #
   cat << EOF > ./sonar-project.properties
   sonar.projectKey=com.example.app
   sonar.projectName=My App Production
   sonar.projectVersion=0.1.0

   sonar.sources=./
   sonar.exclusions=tests/**,vendor/**
   sonar.php.coverage.reportPaths=./phpunit.coverage.xml
   sonar.php.tests.reportPath=./phpunit.report.xml

   sonar.language=php

   sonar.host.url=http://127.0.0.1:9000

   sonar.sourceEncoding=UTF-8
   sonar.dynamicAnalysis=reuseReports
   EOF

   #
   sonar-scanner \
     -Dproject.settings=./sonar-project.properties \
     -Dsonar.login="$SONAR_LOGIN_TOKEN" \
     -X
   ```

```sh
# Git ignore
echo '/.scannerwork' >> ~/.gitignore_global

#
echo '/phpunit.*.xml' >> ./.gitignore
```

## Tips

### Using GNU Make

**Refer:** `./Makefile`

```Makefile
SHELL := /bin/sh

-include ./.env

SONAR_SCANNER ?= sonar-scanner
SONAR_PROJECT_SETTINGS ?= ./sonar-project.properties

.DEFAULT_GOAL := sonar/scanner

.PHONY: sonar/scanner
sonar/scanner:
	@$(SONAR_SCANNER) -Dproject.settings="${SONAR_PROJECT_SETTINGS}" -Dsonar.login="${SONAR_LOGIN_TOKEN}"
```

## Docker

### Running

```sh
#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h sonar-scanner \
  --name sonar-scanner \
  docker.io/sonarsource/sonar-scanner-cli:4.6
```

## Maven Plugin

### Usage

```sh
#
mvn sonar:sonar \
  -Dsonar.login=[username] \
  -Dsonar.password=[password]

#
mvn sonar:sonar \
  -Dsonar.projectKey=[secret] \
  -Dsonar.host.url=http://127.0.0.1:9000 \
  -Dsonar.login=[hash]

#
mvn clean verify sonar:sonar \
  -Dsonar.projectKey=[secret] \
  -Dsonar.host.url=http://127.0.0.1:9000 \
  -Dsonar.login=[hash]
```

<!-- ### Issues -->

<!-- ####

```log
[ERROR] Failed to execute goal org.codehaus.mojo:sonar-maven-plugin:2.6:sonar (default-cli) on project [project-name]: Can not execute SonarQube analysis: Plugin org.codehaus.sonar:sonar-maven3-plugin:7.9.2.30863 or one of its dependencies could not be resolved: Failed to read artifact descriptor for org.codehaus.sonar:sonar-maven3-plugin:jar:7.9.2.30863: Could not transfer artifact org.codehaus.sonar:sonar-maven3-plugin:pom:7.9.2.30863 from/to central (https://repo.maven.apache.org/maven2): Received fatal alert: protocol_version -> [Help 1]
```

TODO -->
