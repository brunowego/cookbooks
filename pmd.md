# Programming Mistake Detector (PMD)

## References

- [Code Repository](https://github.com/pmd/pmd)
- [Main Website](https://pmd.github.io)
- [Apache Maven PMD Plugin](https://maven.apache.org/plugins/maven-pmd-plugin)

## CLI

### Installation

```sh
# Using Homebrew
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
