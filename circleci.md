# CircleCI

<!--
https://github.com/search?o=desc&q=filename%3Aconfig.yml+path%3A.circleci&s=indexed&type=Code
-->

## Links

- [Org. Repository](https://github.com/circleci)
- [Main Website](https://circleci.com/)

## Distributions

- Cloud
- On-premise

## CLI

### Installation

#### Homebrew

```sh
brew install circleci
```

### Commands

```sh
circleci -h
```

### Setup

```sh
#
circleci setup

#
circleci info
```

<!--
./.circleci/config.yml
-->

<!-- ### Usage

```sh
#
circleci
``` -->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension circleci.circleci

#
jq '."recommendations" += ["circleci.circleci"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
