# Workbench

## Startup

```sh
jq '."workbench.startupEditor" |= "newUntitledFile"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Sidebar

### Location

```sh
jq '."workbench.sideBar.location" |= "right"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
