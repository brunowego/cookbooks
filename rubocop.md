# RuboCop

## CLI

### Installation

#### RubyGems

```sh
gem install rubocop
```

### Tips

#### Visual Studio Code

```sh
jq ".\"ruby.rubocop.executePath\" |= \"$HOME/.rbenv/shims/\"" "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq '."ruby.rubocop.executePath" |= "/usr/local/bin/"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
