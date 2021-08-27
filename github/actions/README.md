# Github Actions

<!--
https://github.com/github/super-linter

https://evilmartians.com/chronicles/build-images-on-github-actions-with-docker-layer-caching

https://medium.com/thefork/ios-ci-cd-with-github-actions-e4504228c9d

https://app.pluralsight.com/course-player?clipId=0f892e51-2fc4-4a96-baf5-719efaaa5898

https://github.com/reviewdog/action-hadolint

https://github.com/k6io/example-github-actions/tree/master

https://linkedin.com/learning/github-actions-first-look-2/what-are-github-actions
https://linkedin.com/learning/learning-github-actions-2/automating-with-github-actions-2

https://app.pluralsight.com/library/courses/building-custom-github-actions/table-of-contents

filename:.yml path:.github/workflows

${{ github.event.release.tag_name }}
${{ github.event.inputs.launcher_ref }}

https://github.com/search?o=desc&q=filename%3A.yaml+path%3A.github%2Fworkflows+%22workflow_run%3A%22&s=indexed&type=Code

setup-[name]
action-[name]

ACTIONS_STEP_DEBUG true
-->

## Guides

- [About self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners)
- [Events that trigger workflows](https://docs.github.com/en/actions/reference/events-that-trigger-workflows)
- [Webhook events](https://docs.github.com/en/actions/reference/events-that-trigger-workflows#webhook-events)
- [Manually running a workflow](https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow)
- [Context and expression syntax for GitHub Actions / Operators](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions#operators)
- [Environments](https://docs.github.com/en/actions/reference/environments)
- [Workflow syntax for GitHub Actions / Filter pattern cheat sheet](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions#filter-pattern-cheat-sheet)

## Links

- [GitHub Actions Virtual Environments](https://github.com/actions/virtual-environments)
- [Learning Lab](https://lab.github.com/)
- [Features Actions](https://github.com/features/actions)
- [Starter Workflows](https://github.com/actions/starter-workflows)
- [Become a GitHub Actions Hero](https://github-actions-hero.vercel.app/)
- [Feather - Simply beautiful open source icons](https://feathericons.com)

## Terms

- Software Development Life Cycle (SDLC)

## Solution

### Two Kinds of Actions

- JavaScript Actions
- Docker Actions

### Templates

- [Create a JavaScript Action](https://github.com/actions/javascript-action)
- [Create a JavaScript Action using TypeScript](https://github.com/actions/typescript-action)

### Action Limitations

- Job Concurrency is limited based on your plan.

| GitHub Plan | Concurrent Jobs per Repository |
| ----------- | ------------------------------ |
| Free        | 20                             |
| Pro         | 40                             |
| Team        | 60                             |
| Enterprise  | 180                            |

- Jobs are limited to six hours of runtime.
- 1000 API requests per hour
- Actions can't trigger other workflows
- Logs are limited to 64 KB
- Exceeding limits can cause:
  - Job queueing
  - Failed jobs
- Limits are subject to change
- Workflows are limited to no more than 100 Actions
- Workflows can have up to 100 secrets
- Secrets limited to 64 KB

### Default Environment Variables

```env
GITHUB_WORKFLOW=
GITHUB_ACTION=
GITHUB_ACTOR=
GITHUB_REPOSITORY=
GITHUB_EVENT_NAME=
GITHUB_EVENT_PATH=
GITHUB_WORKSPACE=
GITHUB_SHA=
GITHUB_REF=
HOME=
```

### Artifacts

- Free accounts get 500 MB for storage
- Stored for 90 days
- For pull requests, retention period resets on pushes

### Log Commands

#### The Logging Command Format

```log
::log-command param1=arg,param2=arg::command value

::set-env name=DEBUG::1
```

#### Setting an Output Parameter

```log
::set-output name=name_of_param::value
```

#### Adding a Directory to the PATH

```log
::add-path::/path/to/directory
```

#### Printing a Log Message

```log
::debug file:name,line=0,col=0::message
::warning file:name,line=0,col=0::message
::error file:name,line=0,col=0::message
```

#### Printing a Masked Message

```log
::add-mask::message
```

#### Stopping and Starting the Log Commands

```log
::stop-commands::token
```

### Core Concepts Overview

- Actions
- Artifacts
- CI/CD
- Events
- Runners
- Jobs/Steps
- Workflow File
- Workflow Run

#### Actions

- [GitHub Actions Checkout](https://github.com/actions/checkout)
- [Github Marketplace Actions](https://github.com/marketplace?type=actions)

|           Action Location           |                  Syntax                   |
| ----------------------------------- | ----------------------------------------- |
| Public repository                   | `uses: {owner}/{repo}@{ref}`              |
| The same repository as the workflow | `uses: ./.github/actions/my-local-action` |
| A Docker image registry             | `uses: docker://{image}:{tag}`            |

##### Setups

- [Setup Golang](https://github.com/actions/setup-go)
- [Setup Java](https://github.com/actions/setup-java)
- [Setup Kustomize](https://github.com/imranismail/setup-kustomize)
- [Setup Node](https://github.com/actions/setup-node)
- [Setup PHP](https://github.com/shivammathur/setup-php)
- [Setup Python](https://github.com/actions/setup-python)
- [Setup Ruby](https://github.com/ruby/setup-ruby)

##### Misc

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

#### Artifacts

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

#### CI/CD

TODO

#### Events ([docs](https://docs.github.com/en/actions/reference/events-that-trigger-workflows))

- Webhook Events
  - Branch Creation
  - Issues
  - Members
- Repository Events
  - push
  - pull_request
  - release
- Scheduled Events (e.q. `schedule`)
  - Cron Format
- External Events (e.q. `repository_dispatch`)

#### Runners

##### GitHub-Hosted Runners

```yml
jobs:
  build:
    runs-on: ubuntu-18.04
```

| Virtual Environment | YAML Workflow Label | Default Shell |
| --- | --- | --- |
| macOS Catalina 10.15 | `macos-latest` or `macos-10.15` | Bash |
| Ubuntu 16.04 | `ubuntu-16.04` | Bash |
| Ubuntu 18.04 | `windows-latest` or `ubuntu-18.04` | Bash |
| Windows Server 2019 | `windows-latest` or `windows-2019` | PowerShell |

##### Self-Hosted Runners

```yml
jobs:
  build:
    runs-on: [self-hosted, linux, ARM32]
```

###### Linux

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

###### Windows

- Windows 7 64-bit
- Windows 8.1 64-bit
- Windows 10 64-bit
- Windows Server 2012 R2 64-bit
- Windows Server 2016 64-bit
- Windows Server 2019 64-bit

###### Darwin (macOS)

- macOS 10.13 (High Sierra) or later

#### Jobs/Steps

TODO

### Customize a Workflow Beyond a Template

- Test against multiple target environments
- Dedicated test jobs
- Access to build artifacts
- Branch protections
- Required reviews
- Obvious approvals

### Tips

#### Visual Studio Code

```sh
code --install-extension cschleiden.vscode-github-actions
```

## CLI

### Usage

```sh
#
gh workflow run '[workflow-name]'

#
gh workflow run '[workflow-name]' \
  --ref '[branch-name]'

#
gh run watch
```

<!-- ## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ubuntu \
  -v "$PWD":/usr/src/app \
  -w /usr/src/app \
  --name ubuntu \
  --network workbench \
  docker.io/catthehacker/ubuntu:act-latest /bin/bash
``` -->
