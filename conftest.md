# Conftest

## Links

- [Code Repository](https://github.com/open-policy-agent/conftest)
- [Main Website](https://conftest.dev)

## Related

- [Open Policy Agent (OPA)](/openpolicyagent.md)

<!-- ##

- GitHub Actions
- CircleCI
- Atlantis -->

## CLI

### Installation

#### Homebrew

```sh
brew install conftest
```

#### Darwin Binary

```sh
curl \
  -L \
  'https://github.com/open-policy-agent/conftest/releases/download/v0.25.0/conftest_0.25.0_Darwin_x86_64.tar.gz' | \
    tar -xzC /usr/local/bin conftest
```

#### Linux Binary

```sh
curl \
  -L \
  'https://github.com/open-policy-agent/conftest/releases/download/v0.25.0/conftest_0.25.0_Linux_x86_64.tar.gz' | \
    tar -xzC /usr/local/bin conftest
```

### Commands

```sh
conftest -h
```

### Usage

```sh
#
conftest test \
  ./plan.json \
  -p ./main.rego

#
kustomize build test/kustomize | \
  conftest test \
    -p policy \
    -
```
