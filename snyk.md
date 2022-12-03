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
- [Auth Token](https://app.snyk.io/account)

## Related

- [DeepCodeAI / Org. Repository](https://github.com/DeepCodeAI)

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

### Configuration

```sh
# DeepCode Cache ignore
echo '/.dccache' >> ~/.gitignore_global
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
# or, using environment token variable
SNYK_TOKEN='<token>' snyk auth
# or, using token
snyk auth '<token>'
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
#
code --install-extension snyk-security.snyk-vulnerability-scanner

#
jq '."recommendations" += ["snyk-security.snyk-vulnerability-scanner"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
