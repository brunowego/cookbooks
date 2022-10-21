# Snyk

<!--
snyk/snyk-cli:gradle-5.4
-->

## Links

- [Code Repository](https://github.com/snyk/snyk)
- [Main Website](https://snyk.io/)

## CLI

### Dependencies

- [GCC, the GNU Compiler Collection (gcc)](/gcc.md)
- [Clang](/clang.md)

### Installation

#### Homebrew

```sh
brew tap snyk/tap
brew install snyk
```

### Commands

```sh
#
snyk --help

#
snyk iac --help

#
snyk code --help
```

### Authentication

```sh
# Using browser
snyk auth

# Using environment token variable
SNYK_TOKEN=<TOKEN> snyk auth

# Using token
snyk auth <TOKEN>
```

### Usage

```sh
#
snyk monitor
```

<!--
#
snyk test

#
snyk container test docker.io/library/ubuntu:18.04

#
snyk iac test /path/to/kubernetes_file.yaml
snyk iac test iac/
-->
