# Window

## New window dimensions

### OS X

```sh
jq '."window.newWindowDimensions" |= "maximized"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```
