# ShellCheck

**Keywords:** Shell linter

## References

- [ShellCheck](https://www.shellcheck.net/)

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

#### pre-commit

```yaml
---
repos:
- repo: https://github.com/shellcheck-py/shellcheck-py
  rev: v0.7.2.1
  hooks:
  - id: shellcheck
    language_version: python3.9
    stages: [commit]
```

#### Visual Studio Code

```sh
code --install-extension timonwong.shellcheck
```
