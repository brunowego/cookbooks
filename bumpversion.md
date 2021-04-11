# bumpversion

## CLI

### Installation

#### Homebrew

```sh
brew install bumpversion
```

#### PIP

```sh
pip3 install -U bumpversion
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y bumpversion
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
current_version = 0.0.1
commit = True
tag = True

# Python
[bumpversion:file:setup.py]

[bumpversion:file:app/__init__.py]

# Docker
[bumpversion:file:Dockerfile]

# Node.js
[bumpversion:file:package.json]

# Java
[bumpversion:file:pom.xml]
EOF
```
