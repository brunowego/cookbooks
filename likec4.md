# LikeC4

## Links

- [Code Repository](https://github.com/likec4/likec4)
- [Main Website](https://likec4.dev)
- [Playground](https://likec4.dev/playground)
- [Documentation](https://likec4.dev/docs)

## Tips

### Visual Studio Code

```sh
#
code --install-extension likec4.likec4-vscode

#
jq '."recommendations" += ["likec4.likec4-vscode"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
