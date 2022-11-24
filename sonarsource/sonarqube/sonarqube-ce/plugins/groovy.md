# SonarQube Groovy Plugin

## Links

- [Code Repository](https://github.com/Inform-Software/sonar-groovy)

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
wget -P "$SONARQUBE_HOME/extensions/plugins" 'https://github.com/Inform-Software/sonar-groovy/releases/download/1.8/sonar-groovy-plugin-1.8.jar'
```

## Configuration

Follow [this instructions](/sonarsource/sonarqube-scanner.md#configuration).
