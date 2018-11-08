# Workbench

## Startup

### OS X

```sh
jq '."workbench.startupEditor" |= "newUntitledFile"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

## Sidebar

### Location

#### OS X

```sh
jq '."workbench.sideBar.location" |= "right"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```
