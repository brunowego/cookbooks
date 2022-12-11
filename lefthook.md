# Lefthook

## Links

- [Main Website](https://github.com/evilmartians/lefthook)

## CLI

### Installation

#### go get

```sh
GOBIN=/usr/local/bin go install github.com/evilmartians/lefthook@latest
```

### Commands

```sh
lefthook -h
```

### Configuration

```sh
cat << EOF > ./lefthook.yml

EOF
```

<!--
commit-msg:
  parallel: true
  scripts:
    'commit-message-lint':
      runner: bash

post-commit:
  parallel: true
  scripts:
    'rbw-unlock-warning':
      runner: bash

pre-commit:
  parallel: true
  scripts:
    'protect-branch':
    runner: bash
-->

### Usage

```sh
#
lefthook install

#
lefthook run <hook-name>
```
