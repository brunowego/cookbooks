# Apache Groovy

<!--
https://app.pluralsight.com/paths/skill/continuous-integration-with-jenkins

https://app.pluralsight.com/library/courses/groovy-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/groovy-fundamentals/table-of-contents
https://app.pluralsight.com/guides/introduction-to-testing-with-bdd-and-the-spock-framework

https://www.linkedin.com/learning/learning-groovy/supercharge-your-java-program-with-groovy
-->

## Testing

- Spock

## CLI

### Installation

#### Homebrew

```sh
brew install groovy
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

### Usage

```sh
# Version
groovy -v 2>&1 | tail -1
```
