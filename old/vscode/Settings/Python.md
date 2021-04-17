# Python

## Pylint

```sh
jq '."python.linting.pylintEnabled" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## pydocstyle

```sh
jq '."python.linting.pydocstyleEnabled" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
