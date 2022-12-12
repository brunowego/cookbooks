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
#
jq '."python.linting.flake8Enabled" |= true' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json

#
jq ".\"python.linting.flake8Path\" |= \"$(which flake8)\"" "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json

#
jq '."files.associations"."*.flake8" |= "ini"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## Library

### Installation

```sh
# As user dependency
pip3 install -U flake8

# As project dependency
echo 'flake8==3.8.4' >> ./requirements-dev.txt
```

### Configuration

```sh
#
cat << EOF > ./.flake8
[flake8]
exclude =
  __pycache__,
  .git,
  .venv
max-line-length = 140
EOF

#
flake8
```

### Tips

#### pre-commit

```yml
---
repos:
  - repo: https://gitlab.com/pycqa/flake8
    rev: 3.9.2
    hooks:
      - id: flake8
        stages: [commit]
```

#### NO Quality Assurance

```py
from python import code  # noqa: EXXX,EXXX
```
