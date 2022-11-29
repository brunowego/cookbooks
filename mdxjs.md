# MDX

## CLI

### Tips

#### Visual Studio Code

```sh
#
code --install-extension silvenon.mdx

#
jq '."recommendations" += ["silvenon.mdx"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
