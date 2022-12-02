# direnv

<!--
https://github.com/rubymaniac/vscode-direnv
-->

**Keywords:** dotENV

## Links

- [Main Website](https://direnv.net)

## CLI

### Installation

#### Homebrew

```sh
brew install direnv
```

#### APT

```sh
sudo apt update
sudo apt -y install direnv
```

#### YUM

```sh
yum check-update
sudo yum -y install direnv
```

### Commands

```sh
direnv help
```

### Environment

For Bash or Zsh, put something like this in your shell:

Bash: `$HOME/.bashrc`

```sh
# direnv
eval "$(direnv hook bash)"
```

ZSH: `$HOME/.zshrc`

```sh
# direnv
eval "$(direnv hook zsh)"
```

### Configuration

```sh
echo '/.envrc' >> ~/.gitignore_global
```

### Usage

```sh
#
touch ./.envrc

#
direnv status

#
direnv allow ./

#
direnv reload
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# direnv
command -v direnv > /dev/null && eval "$(direnv hook zsh)" # bash
```

```sh
source ~/.zshrc
```
