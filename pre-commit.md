# pre-commit

## Links

- [Code Repository](https://github.com/pre-commit/pre-commit)
- [Main Website](https://pre-commit.com/)

## CLI

### Installation

#### Homebrew

```sh
brew install pre-commit
```

#### pip

```sh
pip3 install -U pre-commit
```

### Commands

```sh
pre-commit -h
```

### Usage

```sh
#
pre-commit sample-config

#
pre-commit install
pre-commit install-hooks

#
pre-commit run
pre-commit run --all-files

pre-commit run hadolint-docker --all-files

#
pre-commit clean
```

### Issues

#### Missing All Files

```log
black................................................(no files to check)Skipped
flake8...............................................(no files to check)Skipped
isort................................................(no files to check)Skipped
Lint Dockerfiles.....................................(no files to check)Skipped
```

Use with flag `--all-files`.
