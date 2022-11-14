# tfenv

**Keywords:** Terraform Version Manager

## Alternatives

- [asdf Terraform](/asdf/asdf-terraform.md)

## Links

- [Code Repository](https://github.com/tfutils/tfenv)

## CLI

### Installation

#### Homebrew

```sh
brew install tfenv
```

#### Unix-like

```sh
git clone --depth 1 'https://github.com/tfutils/tfenv.git' ~/.tfenv
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
```

### Commands

```sh
tfenv
```

### Configuration

```sh
#
echo '1.3.4' > ./.terraform-version
```

### Usage

```sh
#
tfenv list-remote

#
tfenv install <version>

#
tfenv list

#
tfenv use <version>

#
tfenv uninstall <version>
```
