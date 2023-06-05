# Allero

**Keywords:** Scanning CI/CD Misconfigurations

## Links

- [Code Repository](https://github.com/allero-io/allero)
- [Main Website](https://allero.io)

## CLI

### Installation

#### Homebrew

```sh
brew tap allero-io/allero
brew install allero
```

### Commands

```sh
allero -h
```

### Configuration

```sh
#
export ALLERO_GITHUB_TOKEN=
# or
export GITHUB_TOKEN=

#
allero config set token <token>

#
ls ~/.allero
```

### Usage

```sh
#
allero fetch https://github.com/<owner>/<repo>
allero fetch github <owner>/<repo>

#
allero validate
```
