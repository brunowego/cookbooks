# MDX

## Links

- [Code Repository](https://github.com/mdx-js/mdx/)
- [Main Website](https://mdxjs.com)

## Tips

### Visual Studio Code

```sh
#
code --install-extension unifiedjs.vscode-mdx

#
jq '."recommendations" += ["unifiedjs.vscode-mdx"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
