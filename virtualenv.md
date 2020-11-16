# Virtualenv

## CLI

### Installation

```sh
pip install -U virtualenv
```

### Commands

```sh
virtualenv --help
```

### Configuration

```sh
# Git ignore globally
echo '/.venv' >> ~/.gitignore_global

# Git ignore locally
echo '/.venv' >> ~/.gitignore
```

### Environment

```sh
# Virtualenv
[ -e './.venv' ] && source ./.venv/bin/activate

# if test -e './.venv'; then
#   source ./.venv/bin/activate
# fi
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
