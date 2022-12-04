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

#### Bundler

```sh
bundle add rubocop
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
# List targets
rubocop -L ./

#
rubocop ./

# Only lint cops
rubocop -l ./

# Auto-correct
rubocop -a ./

# Fix-layout
rubocop -x ./

#
rubocop --only 'Style/StringLiterals' ./
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

<!-- ####

**Refer:** `./.fastlane/Fastfile`

```ruby
# frozen_string_literal: true

opt_out_usage
skip_docs

# ...
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
