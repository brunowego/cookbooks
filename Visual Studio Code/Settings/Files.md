# Files

## Trim trailing whitespace

### OS X

```sh
jq '."files.trimTrailingWhitespace" |= true' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

## Exclude

### OS X

```sh
jq '."files.exclude"."**/.git" |= false' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

## Associations

```sh
jq '."files.associations"."*.cnf" |= "ini"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```
