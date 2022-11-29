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
#
code --install-extension misogi.ruby-rubocop

#
jq '."recommendations" += ["misogi.ruby-rubocop"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

```sh
jq ".\"ruby.rubocop.executePath\" |= \"$HOME/.rbenv/shims/\"" "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq '."ruby.rubocop.executePath" |= "/usr/local/bin/"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
