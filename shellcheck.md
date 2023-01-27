# ShellCheck

**Keywords:** Shell linter

## Links

- [Main Website](https://shellcheck.net/)

## CLI

### Installation

#### Homebrew

```sh
brew install shellcheck
```

#### APT

```sh
sudo apt update
sudo apt -y install shellcheck
```

<!-- #### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install shellcheck
``` -->

<!-- ### Configuration

```sh
#
cat << EOF > ./.shellcheckrc

EOF
``` -->

### Commands

```sh
shellcheck --help
```

<!-- ### Usage

```sh
#
shellcheck
``` -->

### Tips

<!-- ####

```sh
# shellcheck disable=SC2081
# shellcheck disable=SC1091
``` -->

<!-- #### pre-commit

```yml
---
repos:
  - repo: https://github.com/shellcheck-py/shellcheck-py
    rev: v0.7.2.1
    hooks:
      - id: shellcheck
        language_version: python3.9
        stages: <commit>
``` -->

#### Visual Studio Code

```sh
#
code --install-extension timonwong.shellcheck

#
jq '."recommendations" += ["timonwong.shellcheck"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### Dinfferent Syntax in POSIX

```log
In POSIX sh, [[ ]] is undefined
```

```sh
#! /bin/sh

if [ "${RUN_MIGRATION}" = "1" ]; then
  # ...
fi
```

#### TBD

```log
Not following: ./_/husky.sh was not specified as input (see shellcheck -x). shellcheck(SC1091)
```

TODO

<!--
if command -v shellcheck >/dev/null; then
  npm run lint:sh
fi
-->
