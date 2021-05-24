# bumpversion

## Links

- [Code Repository](https://github.com/peritus/bumpversion)

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

#### APT

```sh
sudo apt update
sudo apt install -y bumpversion
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

<!--
#
bumpversion release
bumpversion snapshot
-->

### Configuration

#### Simple

```sh
cat << EOF > ./.bumpversion.cfg
[bumpversion]
current_version = 0.0.1
commit = True
tag = True

EOF
```

#### Custom

```sh
cat << EOF > ./.bumpversion.cfg
[bumpversion]
current_version = 0.0.1
commit = True
tag = True
tag_name = v{new_version}
parse = (?P<major>\d+)\.(?P<minor>\d+)\.(?P<patch>\d+)(-(?P<release>[A-Z]+))?
serialize =
	{major}.{minor}.{patch}-{release}
	{major}.{minor}.{patch}

[bumpversion:part:release]
values =
	SNAPSHOT
	RELEASE
optional_value = RELEASE

EOF
```

#### Boilerplate

```sh
# Python
cat << EOF >> ./.bumpversion.cfg
[bumpversion:file:setup.py]
# or
[bumpversion:file:setup.py]
search = VERSION = {current_version}
replace = VERSION = {new_version}

[bumpversion:file:app/__init__.py]
EOF

# Docker
cat << EOF >> ./.bumpversion.cfg

[bumpversion:file:Dockerfile]
EOF

# Node.js
cat << EOF >> ./.bumpversion.cfg

[bumpversion:file:package.json]
EOF

# Java
cat << EOF >> ./.bumpversion.cfg

[bumpversion:file:pom.xml]
EOF
```

### Tips

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[.bumpversion.cfg]
trim_trailing_whitespace = false

EOF
```
