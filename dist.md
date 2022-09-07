# Distribution (abbr: dist)

## Tips

### Visual Studio Code

```sh
jq '."search.exclude"."**/dist" |= true' "$HOME"/.config/Code/User/settings.json | \
  sponge "$HOME"/.config/Code/User/settings.json
```
