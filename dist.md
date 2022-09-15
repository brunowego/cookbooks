# Distribution (abbr: dist)

## Tips

### Visual Studio Code

```sh
jq '."search.exclude"."**/dist" |= true' "$HOME"/.vscode/settings.json | \
  sponge "$HOME"/.vscode/settings.json
```
