# Task

<!--
https://github.com/arduino/setup-task

https://github.com/networkpanic/homecluster/blob/main/Taskfile.yml

https://github.com/hadenlabs/zsh-devops/blob/develop/Taskfile.yml
-->

## Links

- [Code Repository](https://github.com/go-task/task)
- [Main Website](https://taskfile.dev)

## CLI

### Installation

#### Homebrew

```sh
brew tap go-task/tap
brew install go-task
```

#### Linux Binary

```sh
curl \
  -L "https://github.com/go-task/task/releases/download/$(curl -s https://api.github.com/repos/go-task/task/releases/latest | grep tag_name | cut -d '"' -f 4)/task_linux_amd64.tar.gz" | \
  tar -xzC /usr/local/bin task
```

#### Snap

```sh
snap install task --classic
```

#### Chocolatey

```sh
choco install -y go-task
```

#### Scoop

```sh
scoop install task
```

### Commands

```sh
task -h
```

<!-- ### Usage

```sh
cat << EOF > ./Taskfile.yml

EOF
``` -->

<!-- ###

```yml
---
version: '3'

tasks:
  check:
    desc: Exist AWS CLI and dependencies
    run: once
    deps:
      - task: check:aws

  check:aws:
    desc: Exist AWS CLI
    run: once
    preconditions:
      - sh: command -v aws
        msg: Please Install AWS CLI
``` -->
