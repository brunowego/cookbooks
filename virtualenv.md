# Virtualenv

## CLI

### Installation

```sh
pip install virtualenv
```

### Commands

```sh
virtualenv --help
```

### Configuration

```sh
# Git ignore
echo '/.venv' >> ~/.gitignore_global
```

### Usage

```sh
# Venv
virtualenv ./.venv

# Activate
source ./.venv/bin/activate

# Deactivate
deactivate

#
rm -fR ./.venv
```
