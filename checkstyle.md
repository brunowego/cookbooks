# Checkstyle

**Keywords:** Java Linter

## References

- [Apache Maven Checkstyle Plugin](https://maven.apache.org/plugins/maven-checkstyle-plugin/)

## CLI

### Installation

#### Homebrew

```sh
brew install checkstyle
```

#### APT

```sh
sudo apt update
sudo apt -y install checkstyle
```

### Commands

```sh
checkstyle -h
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension shengchen.vscode-checkstyle

#
jq '."recommendations" += ["shengchen.vscode-checkstyle"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!-- ```sh
"java.checkstyle.configuration": "${workspaceFolder}/target/checkstyle-checker.xml"
``` -->

## Maven Plugin

### Usage

```sh
#
mvn checkstyle:checkstyle

#
mvn checkstyle:check
```
