# Snyk

<!--
snyk/snyk-cli:gradle-5.4

https://github.com/snyk-labs/nodejs-goof
-->

**Keywords:** Vulnerability Scanner, SAST

## Links

- [Code Repository](https://github.com/snyk/snyk)
- [Main Website](https://snyk.io/)
- [Snyk Code](https://snyk.io/product/snyk-code/)

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

#
snyk test

#
snyk monitor

#
snyk container test ubuntu:18.04

#
snyk iac test </path/to/iac/>
snyk iac test </path/to/kubernetes_file.yaml>

#
snyk code

#
snyk log4shell

#
snyk config

#
snyk policy

#
snyk ignore
```

### Tips

#### Visual Studio Code

```sh
code --install-extension snyk-security.snyk-vulnerability-scanner
```
