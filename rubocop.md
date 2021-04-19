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
jq ".\"ruby.rubocop.executePath\" |= \"$HOME/.rbenv/shims/\"" "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
jq '."ruby.rubocop.executePath" |= "/usr/local/bin/"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
