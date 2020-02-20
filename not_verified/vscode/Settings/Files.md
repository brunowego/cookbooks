# Files

## Trim Trailing Whitespace

```sh
jq '."files.trimTrailingWhitespace" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Trim Final Newlines

```sh
jq '."files.trimFinalNewlines" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Exclude

```sh
jq '."files.exclude"."**/.git" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

## Associations

```sh
jq '."files.associations"."*.cnf" |= "ini"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
