# Poetry

**Keywords:** Python Package Manager, Isolated Python Environment

## Links

- [Code Repository](https://github.com/python-poetry/poetry)
- [Doc](https://poetry.eustace.io/docs/)

## CLI

### Installation

```sh
# Homebrew
brew install poetry

# Unix-like
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

# pip
pip3 install -U poetry
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Poetry
export PATH="$HOME/.poetry/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
poetry -h
```

### Usage

```sh
#
poetry new ./<app-name>
# or
poetry init

#
poetry env use python3.8
poetry env info
poetry env info --path
poetry env info --executable
poetry env list

#
poetry shell

#
poetry install

#
poetry lock

#
poetry add <package-name>

#
poetry run python ./<script-name>
```
