# Emmet

## References

- [Cheat Sheet](https://docs.emmet.io/cheat-sheet/)

## Tips

### Visual Studio Code

```sh
#
code --install-extension FallenMax.mithril-emmet

#
jq '."recommendations" += ["FallenMax.mithril-emmet"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```
