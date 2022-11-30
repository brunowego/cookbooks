# RuboCop

## Links

- [Code Repository](https://github.com/rubocop/rubocop)
- [Main Website](https://rubocop.org/)

## Docs

- [Configuration](https://docs.rubocop.org/rubocop/configuration)

## CLI

### Installation

#### RubyGems

```sh
gem install rubocop
```

### Commands

```sh
rubocop -h
```

### Initialize

```sh
#
rubocop --init
```

### Configuration

**Refer:** `./.rubocop.yml`

```yml
---
AllCops:
  NewCops: enable
```

### Usage

```sh
#
rubocop -l

#
rubocop -a

#
rubocop -x
```

### Tips

#### Visual Studio Code

**Dependencies:** [Prettier](/prettier.md#visual-studio-code).

- Option 1: [Linter](/linter.md#visual-studio-code).
- Option 2:

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
