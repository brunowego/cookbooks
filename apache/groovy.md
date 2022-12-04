# Apache Groovy

<!--
https://app.pluralsight.com/paths/skill/continuous-integration-with-jenkins

https://app.pluralsight.com/library/courses/groovy-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/groovy-fundamentals/table-of-contents
https://app.pluralsight.com/guides/introduction-to-testing-with-bdd-and-the-spock-framework

https://linkedin.com/learning/learning-groovy/supercharge-your-java-program-with-groovy
-->

## Links

- [Main Website](https://groovy-lang.org/)
- [Code Repository](https://github.com/apache/groovy)

## Tools

- [SDKMAN!](/sdkman.md)

## Testing

- Spock

## CLI

### Installation

#### Homebrew

```sh
brew install groovy
```

#### APT

```sh
sudo apt update
sudo apt -y install groovy
```

#### Chocolatey

```sh
choco install groovy
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Groovy
export GROOVY_HOME='/usr/local/opt/groovy/libexec'
```

```sh
sudo su - "$USER"
```

### Commands

```sh
groovy -h
```

<!-- ```sh
groovyConsole
groovyc
groovydoc
groovysh
``` -->

### Usage

```sh
# Version
groovy -v

# Running
groovy [filename].groovy
```
