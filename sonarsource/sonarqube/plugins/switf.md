# SonarQube Swift (Objective-C/Swift/Java) Plugin

## CLI

### References

- [Code Repository](https://github.com/sonar-next/sonar-swift)

### Dependencies

- [SonarQube](/sonarsource/sonarqube-ce.md)
- [SonarQube Scanner](/sonarsource/sonarqube-scanner.md)

### Installation

```sh
# Darwin
export SONARQUBE_HOME="$(brew --cellar sonarqube)/$(brew info --json sonarqube | jq -r '.[0].installed[0].version')/libexec"

# Linux
# TODO

# Download Newer
wget -P "$SONARQUBE_HOME/extensions/plugins" 'https://github.com/sonar-next/sonar-swift/releases/download/1.7.0/sonar-swift-plugin-1.7.0.jar'
```

### Configuration

Follow [this instructions](/sonarsource/sonarqube-scanner.md#configuration).
