# R

## Dependencies

### Homebrew

```sh
brew install gcc xz pcre
```

### APT

```sh
sudo apt update
sudo apt -y install build-essential libcurl3-dev libreadline-dev gfortran
```

## Installation

```sh
asdf plugin-add R https://github.com/iroddis/asdf-R.git
```

## Version

```sh
asdf list-all R
```

```sh
R_CONFIGURE_OPTIONS=--with-x=no asdf install R [version]
```

## Setting

```sh
asdf global R [version]
```

```sh
asdf list R
asdf reshim R [version]
```
