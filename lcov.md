# LCOV (lcov.info)

## Tips

### Visual Studio Code

```sh
code \
  --install-extension SergeLamikhov.lcov-lang \
  --install-extension markis.code-coverage
```

```sh
# FIXME: Set for current project
jq '."markiscodecoverage.searchCriteria" |= "coverage/lcov*.info"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
