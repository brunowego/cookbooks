# flake8

## CLI

### Installation

#### Homebrew

```sh
brew install flake8
```

### Tips

#### Visual Studio Code

```sh
jq '."python.linting.flake8Enabled" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"

jq ".\"python.linting.flake8Path\" |= \"$(which flake8)\"" "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"

jq '."files.associations"."*.flake8" |= "ini"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Library

### Installation

```sh
# As user dependency
pip install -U flake8

# As project dependency
echo 'flake8==3.8.4' >> ./requirements-dev.txt
```

### Configuration

```sh
cat << EOF > ./.flake8
[flake8]
exclude =
  __pycache__,
  .git,
  .venv
EOF
```

<!--
# noqa: EXXX,EXXX
-->
