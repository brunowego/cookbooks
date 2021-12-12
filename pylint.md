# Pylint

## CLI

### Installation

#### pip

```sh
pip3 install -U pylint
```

### Commands

```sh
pylint --help
```

### Requirements

```sh
# As user dependency
pip3 install -U pylint

# As project dependency
echo 'pylint==2.6.0' >> ./requirements-dev.txt
```

### Configuration

```sh
cat << EOF > ./.pylintrc
[TYPECHECK]
ignored-classes = scoped_session

[FORMAT]
max-line-length = 140
EOF
```

### Tips

#### Visual Studio Code

```sh
jq '."files.associations"."*.pylintrc" |= "ini"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

```sh
jq '."python.linting.pylintEnabled" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

#### Generate RC File

```sh
pylint --generate-rcfile > ./.pylintrc
```

### Issues

#### Pylint Flask

```log
Instance of 'SQLAlchemy' has no 'Column' member pylint(no-member)
```

```sh
# As user dependency
pip3 install -U pylint-flask

# As project dependency
echo 'pylint-flask==0.6' >> ./requirements-dev.txt
```

```sh
jq '."python.linting.pylintArgs" |= ["--load-plugins", "pylint-flask"]' "$PWD/.vscode/settings.json" | \
  sponge "$PWD/.vscode/settings.json"
```

<!--
# pylint: disable=unused-import
-->
