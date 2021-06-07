# direnv

**Keywords:** dotENV

## Links

- [Main Website](https://direnv.net/)

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
eval "$(direnv hook bash)"
eval "$(direnv hook zsh)"

#
direnv reload
```
