# Atlantis

<!--
https://github.com/runatlantis/helm-charts
-->

## CLI

### Installation

#### Homebrew

```sh
brew install atlantis
```

### Commands

```sh
atlantis -h
```

### Usage

```sh
#
atlantis testdrive

# GitHub
atlantis server \
  --gh-user [user] \
  --gh-token [token]

# GitHub
atlantis server \
  --gh-app-id [user] \
  --gh-app-key-file [key-file]

# GitLab
atlantis server \
  --gitlab-user [user] \
  --gitlab-token [token]

# Bitbucket
atlantis server \
  --bitbucket-user [user] \
  --bitbucket-token [token]

# Azure DevOps (ADO)
atlantis server \
  --azuredevops-user [user] \
  --azuredevops-token [token]
```
