# Formance

## Links

- [Main Website](https://formance.com)

## CLI

### Links

- [Code Repository](https://github.com/formancehq/stack)

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
```

### Usage

```sh
#
fctl stack create foobar

#
fctl ledger send world foo 100 EUR/2 --ledger demo

#
fctl ui

# #
# cat << EOF | fctl ledger transactions num
# send [COIN 100] (
#   source = @world
#   destination = @centralbank
# )
# EOF
```

<!--  
auth        Auth server management
cloud       Cloud management
ledger      Ledger management
payments    Payments management
profiles    Profiles management
prompt      Start a prompt
search      Search in all services
stack       Manage your stack
ui          Open UI
webhooks    Webhooks management
-->

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

