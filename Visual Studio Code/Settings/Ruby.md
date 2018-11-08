# Ruby

## Rubocop

### OS X

```sh
jq ".\"ruby.rubocop.executePath\" |= \"$HOME/.rbenv/shims/\"" ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```
