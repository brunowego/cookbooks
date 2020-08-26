# Ballerina

<!--
https://github.com/CORDEA/archivist
-->

## Dependencies

### Homebrew

```sh
brew cask install homebrew/cask-versions/adoptopenjdk8
```

## Installation

### Homebrew

```sh
brew install ballerina
```

## Libraries

### MySQL

#### Homebrew

```sh
curl \
  -L http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.47/mysql-connector-java-5.1.47.jar \
  -o $(brew --prefix ballerina)/bre/lib/mysql-connector-java-5.1.47.jar
```
