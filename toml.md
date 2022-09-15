# Tom's Obvious, Minimal Language (TOML)

## Links

- [Main Website](https://toml.io/en/)

## Tips

### Visual Studio Code

```sh
#
code --install-extension bungcip.better-toml

#
jq '."recommendations" += ["bungcip.better-toml"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
