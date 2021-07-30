# Gitleaks

<!--
https://artifacthub.io/packages/tekton-task/tekton-catalog-tasks/gitleaks
-->

## Alternatives

- [Alternatives](/alternatives.md#code-secrets)

## CLI

### Installation

#### Homebrew

```sh
brew install gitleaks
```

### Commands

```sh
gitleaks -h
```

### Usage

```sh
#
gitleaks \
  --repo-url https://github.com/my-insecure/repo \
  -v \
  --report ./my-report.json

#
gitleaks \
  --path=path/to/local/repo \
  -v \
  --report ./my-report.json
```
