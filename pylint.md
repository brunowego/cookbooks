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

### Tips

#### Generate RC File

```sh
pylint --generate-rcfile > .pylintrc
```

#### Visual Studio Code

```sh
jq '."python.linting.pylintEnabled" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
