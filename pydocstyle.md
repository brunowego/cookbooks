# pydocstyle

## CLI

### Installation

#### pip

```sh
pip3 install -U pydocstyle
```

### Commands

```sh
pydocstyle --help
```

<!-- ### Requirements

```sh
# Development
echo 'pydocstyle==5.1.1' >> ./requirements-dev.txt
``` -->

### Tips

#### Visual Studio Code

```sh
jq '."python.linting.pydocstyleEnabled" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
