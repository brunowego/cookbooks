# bumpversion

## CLI

### Installation

#### Homebrew

```sh
brew install bumpversion
```

#### PIP

```sh
pip install -U bumpversion
```

### Commands

```sh
bumpversion -h
```

### Usage

```sh
#
bumpversion \
  --allow-dirty \
  --verbose \
  --dry-run \
  [major|minor|patch]

#
bumpversion [major|minor|patch]

#
bumpversion --tag release
```

### Configuration

```sh
cat << EOF > ./.bumpversion.cfg
[bumpversion]
current_version = 0.0.2
commit = True
tag = True

# Python
[bumpversion:file:setup.py]

[bumpversion:file:app/__init__.py]

# Docker
[bumpversion:file:Dockerfile]

# Node.js
[bumpversion:file:package.json]
EOF
```
