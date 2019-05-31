# Editor

## Fira Code

## OS X

```sh
brew tap homebrew/cask-fonts
brew cask install font-fira-code
```

```sh
jq '."editor.fontFamily" |= "'\''Fira Code'\''"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

```sh
jq '."editor.fontLigatures" |= true' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

## Render whitespace

### OS X

```sh
jq '."editor.renderWhitespace" |= "all"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

## Minimap

### OS X

```sh
jq '."editor.minimap.enabled" |= false' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

## Scroll beyond last line

### OS X

```sh
jq '."editor.scrollBeyondLastLine" |= false' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```

## Word Wrap

### OS X

```sh
jq '."editor.wordWrap" |= "on"' ~/Library/Application\ Support/Code/User/settings.json | sponge ~/Library/Application\ Support/Code/User/settings.json
```
