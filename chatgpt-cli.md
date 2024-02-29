# ChatGPT CLI

## Links

- [Code Repository](https://github.com/kardolus/chatgpt-cli)

## Installation

### Homebrew

```sh
brew tap kardolus/chatgpt-cli
brew install chatgpt-cli
```

### Configuration

```sh
# https://platform.openai.com/account/api-keys

export OPENAI_API_ORG='org-...'
export OPENAI_API_HOST='https://api.openai.com'
export OPENAI_API_KEY='sk-...'
```

### Commands

```sh
chatgpt -h
```

### Usage

```sh
#
chatgpt what is the capital of the Netherlands

#
cat ./<file-name> | chatgpt 'What kind of toy would Kya enjoy?'
```

### Tips

#### TBD

```sh
cat ./<file-name>.tsx | chatgpt 'Translate each Korean sentence to English.'
```

### Issues

#### TBD

```log
http status 429: You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.
```

<!--
After pay need wait some time to be able to use the API again.
-->

TODO
