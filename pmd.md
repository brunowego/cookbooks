# Programming Mistake Detector (PMD)

## References

- [Apache Maven PMD Plugin](https://maven.apache.org/plugins/maven-pmd-plugin/)

## CLI

### Installation

#### Homebrew

```sh
brew install pmd
```

### Commands

```sh
pmd
```

### Usage

```sh
#
pmd -d /usr/src -R ./rulesets/java/quickstart.xml -f text
```

## Maven Plugin

### Usage

```sh
#
mvn pmd:check
```
