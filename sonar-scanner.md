# SonarQube Scanner

## CLI

### Dependencies

- [SonarQube](/sonarqube.md)

### Installation

#### Homebrew

```sh
brew install sonarqube sonar-scanner
```

### Configuration

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
