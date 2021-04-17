# Miscellaneous

## Breadcrumbs

```sh
jq '."breadcrumbs.enabled" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
