# Pluralith

## Links

- [Org. Repository](https://github.com/Pluralith)
- [Main Website](https://pluralith.com)
- [Docs](https://docs.pluralith.com)
- [Download](https://pluralith.com/thanks/)

## CLI

### Links

- [Code Repository](https://github.com/Pluralith/pluralith-cli)
- [Docs](https://docs.pluralith.com/docs/category/cli-commands)

### Installation

<!-- #### Homebrew

```sh
brew tap pluralith/pluralith https://github.com/Pluralith/pluralith-homebrew-tap
brew install pluralith
``` -->

#### Darwin Binary

```sh
wget -O /usr/local/bin/pluralith https://github.com/Pluralith/pluralith-cli/releases/download/v0.2.2/pluralith_cli_darwin_amd64_v0.2.2 && chmod +x /usr/local/bin/pluralith
```

### Commands

```sh
pluralith -h
```

### Initialize

**User Settings:** [API Key](https://app.pluralith.com/#/user/settings)

```sh
#
pluralith login

#
pluralith init
```

<!-- ### Usage

```sh
#
pluralith graph

#
pluralith plan

#
pluralith apply

#
pluralith install

#
pluralith run

#
pluralith strip

#
pluralith update

#
pluralith destroy
``` -->

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Pluralith
source <(pluralith completion zsh) # bash
```

```sh
source ~/.zshrc
```
