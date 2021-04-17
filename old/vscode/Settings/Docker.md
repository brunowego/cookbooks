# Docker

## hadolint

```sh
jq '."hadolint.hadolintPath" |= "/usr/local/bin/hadolint"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
