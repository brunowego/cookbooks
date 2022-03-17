# Visual Studio Code Settings

<!-- ## Tab Size

```sh
jq '."editor.tabSize" |= 2' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

<!-- ## Auto Save

```sh
jq '."files.autoSave" |= "afterDelay"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

## Breadcrumbs

```sh
jq '."breadcrumbs.enabled" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Render whitespace

```sh
jq '."editor.renderWhitespace" |= "all"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Minimap

```sh
jq '."editor.minimap.enabled" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Scroll beyond last line

```sh
jq '."editor.scrollBeyondLastLine" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Word Wrap

```sh
jq '."editor.wordWrap" |= "on"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

<!-- ## Rulers

```sh
jq '."editor.rulers" |= [100, 120]' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

<!-- ## Trim Trailing Whitespace

```sh
jq '."files.trimTrailingWhitespace" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

<!-- ## Trim Final Newlines

```sh
jq '."files.trimFinalNewlines" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

<!-- ## Exclude

```sh
jq '."files.exclude"."**/.git" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

<!-- ## Associations

```sh
jq '."files.associations"."*.cnf" |= "ini"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
``` -->

## New window dimensions

```sh
jq '."window.newWindowDimensions" |= "maximized"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Startup

```sh
jq '."workbench.startupEditor" |= "newUntitledFile"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## SideBar Location

```sh
jq '."workbench.sideBar.location" |= "right"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Open Side by Side Direction

```sh
jq '."workbench.editor.openSideBySideDirection" |= "down"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
