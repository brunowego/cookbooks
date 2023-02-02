# Colima

## Links

- [Code Repository](https://github.com/abiosoft/colima)

## CLI

### Installation

#### Homebrew

```sh
brew install colima
```

### Commands

```sh
colima -h
```

### Usage

```sh
#
colima list

#
colima start \
  --cpu 2 \
  --memory 4 \
  --disk 80

colima start default

#
colima status

#
colima stop

#
colima delete default
```

<!--
kubernetes
nerdctl
ssh
ssh-config
template
-->

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Colima
source <(colima completion zsh) # bash
```

```sh
source ~/.zshrc
```
