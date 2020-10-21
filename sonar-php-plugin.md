# SonarQube PHP Plugin

<!--
https://github.com/ivan-berezhnov/symfony_3/blob/master/sonar-project.properties

https://github.com/curlybracket-nl/sonarqube-scanner
https://blog.e-zest.com/how-to-test-php-code-quality-using-sonarqube
https://stackoverflow.com/questions/45421333/jenkins-pipeline-job-build
https://pt.slideshare.net/up1/03-sonar

https://www.youtube.com/watch?v=7xjgDPzl128
https://phpmetrics.org/
https://blog.setapp.pl/gitlab-integration-tutorial/
https://blog.setapp.pl/how-to-use-sonarscanner/
https://www.8ym8.com/340517.html

https://nullsweep.com/creating-a-secure-pipeline-jenkins-with-sonarqube-and-dependencycheck/
https://jenkins.io/blog/2017/04/18/continuousdelivery-devops-sonarqube/
https://geekalicious.pt/pt/continuous-integration/analisar-projeto-php-laravel-5-multilingua-com-sonarqube/
https://dzone.com/articles/sonarqube-scanning-in-15-minutes-2
https://github.com/rogervila/php-sonarqube-scanner-test
https://imasters.com.br/back-end/configurando-sonarqube-e-phpstorm
https://dev.to/jeromegamez/continuous-php-code-quality-with-sonarcloud-276i
https://www.jeffgeerling.com/blogs/jeff-geerling/ci-deployments-code-analysis-drupal-php
-->

## CLI

### References

- [Docs](https://docs.sonarqube.org/latest/analysis/languages/php/)
- [SonarPHP](https://github.com/SonarSource/sonar-php)

### Dependencies

- [SonarQube](/sonarqube.md)
- [SonarQube Scanner](/sonar-scanner.md)

### Installation

```sh
# Darwin
export SONARQUBE_HOME="$(brew --cellar sonarqube)/$(brew info --json sonarqube | jq -r '.[0].installed[0].version')/libexec"

# Linux
TODO

# Remove Current
rm "$SONARQUBE_HOME"/extensions/plugins/sonar-php-plugin-*

# Download Newer
wget -P "$SONARQUBE_HOME/extensions/plugins" 'https://binaries.sonarsource.com/Distribution/sonar-php-plugin/sonar-php-plugin-3.3.0.5166.jar'
```

### Configuration

1. Projects -> Create new project
   - Project key: com.example.app:master
   - Display name: My App Production
   - Set Up
2. Provide a token
   - Generate a token: example-token
   - Generate
   - Continue
3. Run analysis on your project
   - What is your project's main language?: Other (JS, TS, Go, Python, PHP, ...)
   - What is your OS?: macOS
   - Download and unzip the Scanner for macOS: Click Download
   - Execute the Scanner from your computer

   ```sh
   sonar-scanner \
     -Dsonar.language=php \
     -Dsonar.projectKey=com.example.app:master \
     -Dsonar.sources=. \
     -Dsonar.host.url=http://127.0.0.1:9000 \
     -Dsonar.login=example-token
   ```

   ```sh
   cat << EOF > ./sonar-project.properties
   sonar.projectKey=com.example.app:master
   sonar.projectName=Example App
   sonar.projectVersion=0.1.0

   sonar.sources=.
   sonar.exclusions=vendor/**,tests/**

   sonar.language=php

   sonar.host.url=http://127.0.0.1:9000

   sonar.sourceEncoding=UTF-8
   EOF
   ```

   ```sh
   sonar-scanner -Dproject.settings=sonar-project.properties
   ```

```sh
# Git ignore
echo '/.scannerwork' >> ~/.gitignore_global
```

### Issues

#### Java Binaries

```log
ERROR: Error during SonarQube Scanner execution
org.sonar.java.AnalysisException: Please provide compiled classes of your project with sonar.java.binaries property
	at org.sonar.java.JavaClasspath.init(JavaClasspath.java:64)
	at org.sonar.java.AbstractJavaClasspath.getElements(AbstractJavaClasspath.java:280)
	at org.sonar.java.SonarComponents.getJavaClasspath(SonarComponents.java:209)
	at org.sonar.java.JavaSquid.<init>(JavaSquid.java:84)
	at org.sonar.plugins.java.JavaSquidSensor.execute(JavaSquidSensor.java:87)
```

```sh
sonar-scanner \
  [...] \
  -Dsonar.java.binaries=$SONARQUBE_HOME/lib
```
