# Window

## New window dimensions

```sh
jq '."window.newWindowDimensions" |= "maximized"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
