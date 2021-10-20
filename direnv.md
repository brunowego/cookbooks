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

### Usage

```sh
#
touch ./.envrc

#
direnv allow ./

#
direnv reload
```

### Tips

#### Autocomplete

```sh
# direnv
command -v direnv > /dev/null && eval "$(direnv hook bash)" # if bash
command -v direnv > /dev/null && eval "$(direnv hook zsh)" # if zsh
```
