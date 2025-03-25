# Cursor Settings

## Dependencies

- [jq](/jq.md#cli)
- [moreutils](/moreutils.md)

<!--
  "files.watcherExclude": {
    "**/.yarn/*/**": true
  }
-->

## Configuration

```sh
#
cat "$HOME"/.cursor/settings.json

# Terminal Scrollback
# jq '."terminal.integrated.scrollback" |= 100000000' "$HOME"/.cursor/settings.json | \
#   sponge "$HOME"/.cursor/settings.json

# Breadcrumbs
jq '."breadcrumbs.enabled" |= false' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Activity Bar Orientation
jq '."workbench.activityBar.orientation" |= "vertical"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Workspace Trust
# jq '."security.workspace.trust.enabled" |= false' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Render whitespace
jq '."editor.renderWhitespace" |= "all"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Minimap
# jq '."editor.minimap.enabled" |= false' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Scroll beyond last line
jq '."editor.scrollBeyondLastLine" |= false' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Word Wrap
jq '."editor.wordWrap" |= "on"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Font Size
jq '."editor.fontSize" = 14' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

#
# jq '."editor.scrollBeyondLastColumn" = 0' "$HOME"/.cursor/settings.json | \
#   sponge "$HOME"/.cursor/settings.json

# Startup
# jq '."workbench.startupEditor" |= "newUntitledFile"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# SideBar Location
jq '."workbench.sideBar.location" |= "right"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Open Side by Side Direction
# jq '."workbench.editor.openSideBySideDirection" |= "down"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json
# jq '."workbench.editor.splitInGroupLayout" |= "vertical"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json
```

<!--
"files.exclude": {
  "**/.git": false
},
-->

<!--
# Auto Save
# jq '."files.autoSave" |= "afterDelay"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Rulers
# jq '."editor.rulers" |= [100, 120]' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Trim Trailing Whitespace
# jq '."files.trimTrailingWhitespace" |= true' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Trim Final Newlines
# jq '."files.trimFinalNewlines" |= true' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Associations
# jq '."files.associations"."*.cnf" |= "ini"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# New window dimensions
# jq '."window.newWindowDimensions" |= "maximized"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Zoom Level
# jq '."window.zoomLevel" = 0' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

# Tab Size
# jq '."editor.tabSize" |= 2' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json
-->

## Key Bindings

<!--
https://github.com/Microsoft/cursor/issues/4504
-->

```sh
#
cat "$HOME"/Library/Application\ Support/Code/User/keybindings.json

#
echo '[]' > "$HOME"/Library/Application\ Support/Code/User/keybindings.json

#
jq '.[.| length] |= . + {"key": "ctrl+cmd+k","command": "workbench.output.action.clearOutput"}' "$HOME"/Library/Application\ Support/Code/User/keybindings.json | sponge "$HOME"/Library/Application\ Support/Code/User/keybindings.json
```
