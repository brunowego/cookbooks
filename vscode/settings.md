# Visual Studio Code Settings

## Dependencies

- [jq](/jq.md#cli)
- [moreutils](/moreutils.md)

<!--
  "files.watcherExclude": {
    "**/.yarn/*/**": true
  }
-->

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

## Configuration

```sh
# Breadcrumbs
jq '."breadcrumbs.enabled" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Render whitespace
jq '."editor.renderWhitespace" |= "all"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Minimap
jq '."editor.minimap.enabled" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Scroll beyond last line
jq '."editor.scrollBeyondLastLine" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Word Wrap
jq '."editor.wordWrap" |= "on"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Font Size
jq '."editor.fontSize" = 14' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Startup
jq '."workbench.startupEditor" |= "newUntitledFile"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# SideBar Location
jq '."workbench.sideBar.location" |= "right"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Open Side by Side Direction
jq '."workbench.editor.openSideBySideDirection" |= "down"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq '."workbench.editor.splitInGroupLayout" |= "vertical"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

<!--
# Auto Save
# jq '."files.autoSave" |= "afterDelay"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Rulers
# jq '."editor.rulers" |= [100, 120]' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Trim Trailing Whitespace
# jq '."files.trimTrailingWhitespace" |= true' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Trim Final Newlines
# jq '."files.trimFinalNewlines" |= true' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Associations
# jq '."files.associations"."*.cnf" |= "ini"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# New window dimensions
# jq '."window.newWindowDimensions" |= "maximized"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Zoom Level
# jq '."window.zoomLevel" = 0' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Tab Size
# jq '."editor.tabSize" |= 2' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
-->
