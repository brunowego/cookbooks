# Formance

## Links

- [Code Repository](https://github.com/formancehq/stack)
- [Main Website](https://formance.com)

## CLI

### Links

- [Code Repository](https://github.com/formancehq/fctl)

### Installation

#### Homebrew

```sh
brew tap formancehq/tap
brew install fctl
```

### Commands

```sh
fctl -h
```

### Initialize

```sh
#
fctl login

#
cat ~/.formance/fctl.config

#
fctl cloud me info
```

### Usage

```sh
#
fctl stack create foobar

#
fctl ledger send world foo 100 EUR/2 --ledger demo
fctl ledger stats

#
fctl ui

#
fctl auth clients list

#
fctl auth users list

#
fctl cloud

#
fctl payments connectors install

#
fctl profiles list

#
fctl prompt

#
fctl webhooks list
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# kbenv
source <(fctl completion zsh) # bash
```

```sh
source ~/.zshrc
```
