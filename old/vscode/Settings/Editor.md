# Editor

## Fira Code

### Dependencies

- [Fira Code Font](/fira-code-font.md)

### Configuration

```sh
jq '."editor.fontFamily" |= "'\''Fira Code'\''"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
jq '."editor.fontLigatures" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
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

## Rulers

```sh
jq '."editor.rulers" |= [100, 120]' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
