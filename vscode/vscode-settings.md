# Visual Studio Code Settings

## Key Bindings

<!--
https://github.com/Microsoft/vscode/issues/4504
-->

```sh
#
cat "$HOME"/Library/Application\ Support/Code/User/keybindings.json

#
echo '[]' > "$HOME"/Library/Application\ Support/Code/User/keybindings.json

#
jq '.[.| length] |= . + {"key": "ctrl+cmd+k","command": "workbench.output.action.clearOutput"}' "$HOME"/Library/Application\ Support/Code/User/keybindings.json | sponge "$HOME"/Library/Application\ Support/Code/User/keybindings.json
```

<!-- ## Tab Size

```sh
#
jq '."editor.tabSize" |= 2' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->

<!-- ## Auto Save

```sh
#
jq '."files.autoSave" |= "afterDelay"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->

## Breadcrumbs

```sh
#
jq '."breadcrumbs.enabled" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## Render whitespace

```sh
#
jq '."editor.renderWhitespace" |= "all"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## Minimap

```sh
#
jq '."editor.minimap.enabled" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## Scroll beyond last line

```sh
#
jq '."editor.scrollBeyondLastLine" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## Word Wrap

```sh
#
jq '."editor.wordWrap" |= "on"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

<!-- ## Rulers

```sh
#
jq '."editor.rulers" |= [100, 120]' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->

<!-- ## Trim Trailing Whitespace

```sh
#
jq '."files.trimTrailingWhitespace" |= true' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->

<!-- ## Trim Final Newlines

```sh
#
jq '."files.trimFinalNewlines" |= true' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->

## Exclude

```sh
#
jq '."files.exclude"."**/.git" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

<!-- ## Associations

```sh
#
jq '."files.associations"."*.cnf" |= "ini"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->

## New window dimensions

```sh
#
jq '."window.newWindowDimensions" |= "maximized"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

<!-- ## Zoom Level

```sh
#
jq '."window.zoomLevel" = 0' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
``` -->

## Font Size

```sh
#
jq '."editor.fontSize" = 14' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## Startup

```sh
#
jq '."workbench.startupEditor" |= "newUntitledFile"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## SideBar Location

```sh
#
jq '."workbench.sideBar.location" |= "right"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

## Open Side by Side Direction

```sh
#
jq '."workbench.editor.openSideBySideDirection" |= "down"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

#
jq '."workbench.editor.splitInGroupLayout" |= "vertical"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
