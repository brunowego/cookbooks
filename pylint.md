# Pylint

## CLI

### Installation

#### PIP

```sh
pip install -U pylint
```

### Commands

```sh
pylint --help
```

### Requirements

```sh
# Development
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

#### Flask

```sh
# As user dependency
pip install -U pylint-flask

# As project dependency
echo 'pylint-flask==0.6' >> ./requirements-dev.txt
```

```sh
jq '."python.linting.pylintArgs" |= ["--load-plugins", "pylint-flask"]' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

<!--
# pylint: disable=unused-import
-->
