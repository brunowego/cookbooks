# gptcommit

<!--
https://github.com/RomanHotsiy/commitgpt
-->

## Links

- [Code Repository](https://github.com/zurawiki/gptcommit)

<!--
https://platform.openai.com/account/api-keys
-->

## CLI

### Installation

```sh
brew tap zurawiki/brews
brew install gptcommit
```

### Commands

```sh
gptcommit -h
```

### Configuration

```sh
# Globally
gptcommit config set openai.api_key 'sk-...'
# Or locally
gptcommit config set --local openai.api_key 'sk-...'

#
gptcommit config keys

#
gptcommit config set allow-amend true

#
cat "$HOME/.config/gptcommit/config.toml"
```

<!-- ### Usage

```sh
#
gptcommit install

#
git commit
``` -->
