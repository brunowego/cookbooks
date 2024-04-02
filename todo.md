# To Do (TODO)

## Tokens

- TODO:
- NOTE:
- FIXME:
- INFO:
- HACK:
- WARN:
- BUG:
- REVIEW:
- REMOVE:
- BACKLOG:

## Tips

### Visual Studio Code

```sh
#
code --install-extension wayou.vscode-todo-highlight

#
jq '."recommendations" += ["wayou.vscode-todo-highlight"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```
