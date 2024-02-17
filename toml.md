# Tom's Obvious, Minimal Language (TOML)

<!--
https://github.com/tamasfe/taplo
-->

## Links

- [Main Website](https://toml.io/en/)

## Tips

### Visual Studio Code

```sh
#
code --install-extension tamasfe.even-better-toml

#
jq '."recommendations" += ["tamasfe.even-better-toml"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
