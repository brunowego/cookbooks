# RuboCop

## Links

- [Code Repository](https://github.com/rubocop/rubocop)
- [Main Website](https://rubocop.org/)

## Docs

- [Configuration](https://docs.rubocop.org/rubocop/configuration)

## CLI

### Installation

#### Bundler

```sh
bundle add rubocop
```

### Commands

```sh
bundle exec rubocop -h
```

### Initialize

```sh
#
bundle exec rubocop --init
```

### Configuration

```sh
#
cat << EOF > ./.rubocop.yml
---
AllCops:
  NewCops: enable
EOF
```

### Usage

```sh
# List targets
bundle exec rubocop -L ./

#
bundle exec rubocop ./

# Only lint cops
bundle exec rubocop -l ./

# Auto-correct
bundle exec rubocop -a ./

# Fix-layout
bundle exec rubocop -x ./

#
bundle exec rubocop --only 'Style/StringLiterals' ./
```

### Tips

<!-- ####

```rb
# rubocop:disable Metrics/MethodLength
# ...
# rubocop:enable Metrics/MethodLength
``` -->

<!-- ####

```log
git add -N .; git diff --name-only | xargs rubocop
``` -->

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

  **Configuration:**

  ```sh
  jq ".\"ruby.rubocop.executePath\" |= \"$HOME/.rbenv/shims/\"" "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
  jq '."ruby.rubocop.executePath" |= "/usr/local/bin/"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
  ```
