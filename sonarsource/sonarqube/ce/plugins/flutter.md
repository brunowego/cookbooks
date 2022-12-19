# SonarQube Flutter (Dart) Plugin

## Links

- [Code Repository](https://github.com/insideapp-oss/sonar-flutter)

## Dependencies

- [SonarQube](/sonarsource/sonarqube-ce.md)
- [SonarQube Scanner](/sonarsource/sonarqube-scanner.md)

## Installation

```sh
# Darwin
export SONARQUBE_HOME="$(brew --cellar sonarqube)/$(brew info --json sonarqube | jq -r '.[0].installed[0].version')/libexec"

# Linux
# TODO

# Download Newer
wget -P "$SONARQUBE_HOME/extensions/plugins" 'https://github.com/insideapp-oss/sonar-flutter/releases/download/0.4.0/sonar-flutter-plugin-0.4.0.jar'
```

## Configuration

Follow [this instructions](/sonarsource/sonarqube-scanner.md#configuration).
