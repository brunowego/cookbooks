# Git-flow

**Keywords:** Git Workflow

## Links

- [Main Website](https://jeffkreeftmeijer.com/git-flow)

## Branches

- `main`
- `develop`
- `feature`
- `release`

## Guides

- [Patterns for Managing Source Code Branches](https://martinfowler.com/articles/branching-patterns.html)

## Benefits of Git Flow

- Workflow is based around releases
- Allows for parallel development by leveraging short-lived branches for features, hotfixes, and releases
- Pull/merge requests used for updates to master and develop

## Workflow Comparison

| Trunk Based                       | Git Flow                       |
| --------------------------------- | ------------------------------ |
| Single long-lived branch          | Multiple branches/types        |
| Work is always release ready      | Master branch is release ready |
| Compliments continuous deployment | Compliments releases           |

## CLI

### Installation

#### Homebrew

```sh
brew install git-flow-avh
```

#### APT

```sh
sudo apt update
sudo apt -y install git-flow
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install gitflow
```

### Commands

```sh
git flow help
```

### Usage

```sh
# Initialize
git flow init
```
