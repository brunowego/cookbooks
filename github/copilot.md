# GitHub Copilot

<!--
https://githubnext.com/projects/copilot-cli/

https://githubnext.com/
-->

## Links

- [Main Website](https://github.com/features/copilot)

## Tips

### Visual Studio Code

```sh
#
code --install-extension GitHub.copilot

#
jq '."recommendations" += ["GitHub.copilot"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```
