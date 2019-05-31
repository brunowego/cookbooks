# Docker

## hadolint

### OS X

```sh
jq '."hadolint.hadolintPath" |= "/usr/local/bin/hadolint"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```
