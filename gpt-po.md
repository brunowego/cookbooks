# PO File Translation Tool for ChatGPT (gpt-po)

## Links

- [Code Repository](https://github.com/ryanhex53/gpt-po)

## CLI

### Installation

```sh
# Using NPM
npm install gpt-po -g
```

### Commands

```sh
gpt-po -h
gpt-po translate -h
```

### Configuration

```sh
# https://platform.openai.com/account/api-keys

export OPENAI_API_ORG='org-...'
export OPENAI_API_HOST='https://api.openai.com'
export OPENAI_API_KEY='sk-...'
```

### Usage

```sh
#
gpt-po --po ./messages.po -l Portuguese --verbose
gpt-po translate --po ./messages.po -l Portuguese --verbose
```
