# tfenv

**Keywords:** Terraform Version Manager

## Alternatives

- [asdf Terraform](/asdf/terraform.md)

## Links

- [Code Repository](https://github.com/tfutils/tfenv)

## CLI

### Installation

```sh
# Using Homebrew
brew install tfenv

# Using Unix-like
git clone --depth 1 'https://github.com/tfutils/tfenv.git' ~/.tfenv
```

### Environment

**Only:** For Unix-like installation.

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshenv`:

```sh
# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
```

### Commands

```sh
tfenv -h
```

### Configuration

```sh
#
curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v'

#
echo '1.14.1' > ./.terraform-version
```

### Usage

```sh
#
tfenv list-remote

#
tfenv install
tfenv install <version>

#
tfenv list

#
tfenv use <version>

#
tfenv uninstall <version>
```

### Issues

#### TBD

```log
Not instructed to use Local PGP (/usr/local/Cellar/tfenv/3.0.0/use-{gpgv,gnupg}) & No keybase install found, skipping OpenPGP signature verification
```

TODO
