# OpenAI

## Links

- [Main Website](https://openai.com)
- [Status Page](https://status.openai.com)
- [Usage](https://platform.openai.com/usage)
- [Logs](https://platform.openai.com/logs)
- Account
  - [API keys](https://platform.openai.com/api-keys)
- Docs
  - [Models](https://platform.openai.com/docs/models)

## CLI

### Installation

```sh
pipx install openai
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshenv`:

```sh
# OpenAI
export OPENAI_API_KEY='<api-key>'
```

```sh
source ~/.zshrc
```

### Commands

```sh
openai --help
```

### Issues

#### TBD

```log
@acme/app:eval:watch: AI_RetryError: Failed after 3 attempts. Last error: You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.
```

<!--
Problem with Credit Card

https://platform.openai.com/settings/organization/billing/overview
-->

TODO
