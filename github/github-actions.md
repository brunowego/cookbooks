# Github Actions

<!--
https://github.com/k6io/example-github-actions/tree/master

https://linkedin.com/learning/github-actions-first-look-2/what-are-github-actions
https://linkedin.com/learning/learning-github-actions-2/automating-with-github-actions-2

https://app.pluralsight.com/library/courses/building-custom-github-actions/table-of-contents

filename:.yml path:.github/workflows
-->

## Guides

- [About self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
- [Events that trigger workflows](https://docs.github.com/en/actions/reference/events-that-trigger-workflows)

## Links

- [Learning Lab](https://lab.github.com/)
- [Features Actions](https://github.com/features/actions)
- [Starter Workflows](https://github.com/actions/starter-workflows)
- [Become a GitHub Actions Hero](https://github-actions-hero.vercel.app/)

## Terms

- Software Development Life Cycle (SDLC)

## Core Concepts Overview

- Actions
- Artifacts
- CI/CD
- Events
- Runners
- Jobs/Steps
- Workflow File
- Workflow Run

### Actions

- [GitHub Actions Checkout](https://github.com/actions/checkout)
- [Github Marketplace Actions](https://github.com/marketplace?type=actions)

**Setups**

- [Setup Golang](https://github.com/actions/setup-go)
- [Setup Java](https://github.com/actions/setup-java)
- [Setup Kustomize](https://github.com/imranismail/setup-kustomize)
- [Setup Node](https://github.com/actions/setup-node)
- [Setup PHP](https://github.com/shivammathur/setup-php)
- [Setup Python](https://github.com/actions/setup-python)
- [Setup Ruby](https://github.com/ruby/setup-ruby)

**Misc**

- [Pull Request Labeler](https://github.com/actions/labeler)
- [Label approved pull requests](https://github.com/abinoda/label-when-approved-action)
- [GIPHY Generator](https://github.com/IAmHughes/giphy-generator)

<!--
docker://sonarsource/sonar-scanner-cli:latest
azure/setup-kubectl@v1
imranismail/setup-kustomize@v1
azure/k8s-set-context@v1
actions/setup-python@v1
BSFishy/pip-action@v1
chrisdickinson/setup-yq@latest
clowdhaus/argo-cd-action/@main
wangchucheng/git-repo-sync@v0.1.0
-->

<!-- ##

- Supercharged GitHub Flow -->

### Artifacts

- [Upload-Artifact v2](https://github.com/actions/upload-artifact)
- [Download-Artifact v2](https://github.com/actions/download-artifact)

```yml
jobs:
  build:
    steps:
      # ...
      - uses: actions/upload-artifact@@v2
        with:
          name: artifacts
          path: public/
```

### CI/CD

### Events

- GitHub Webhook Events
- Scheduled Events (e.q. `schedule`)
- External Events (e.q. `repository_dispatch`)

### Runners

#### GitHub-Hosted Runners

```yml
jobs:
  build:
    runs-on: ubuntu-latest
```

| Virtual Environment | YAML Workflow Label |
| --- | --- |
| macOS Catalina 10.15 | `macos-latest` or `macos-10.15` |
| Ubuntu 16.04 | `ubuntu-16.04` |
| Ubuntu 18.04 | `windows-latest` or `ubuntu-18.04` |
| Windows Server 2019 | `windows-latest` or `windows-2019` |

#### Self-Hosted Runners

```yml
jobs:
  build:
    runs-on: [self-hosted, linux, ARM32]
```

**Linux**

- CentOS 7
- Debian 9 or later
- Fedora 29 or later
- Linux Mint 18 or later
- openSUSE 15 or later
- Orache Linux 7
- Red Hat Enterprise Linux 7
- SP2 or later
- SUSE Enterprise Linux (SLES) 12
- Ubuntu 16.04 or later

**Windows**

- Windows 7 64-bit
- Windows 8.1 64-bit
- Windows 10 64-bit
- Windows Server 2012 R2 64-bit
- Windows Server 2016 64-bit
- Windows Server 2019 64-bit

**Darwin (macOS)**

- macOS 10.13 (High Sierra) or later

### Jobs/Steps

TODO

## Customize a Workflow Beyond a Template

- Test against multiple target environments
- Dedicated test jobs
- Access to build artifacts
- Branch protections
- Required reviews
- Obvious approvals

## Tips

### Visual Studio Code

```sh
code --install-extension cschleiden.vscode-github-actions
```
