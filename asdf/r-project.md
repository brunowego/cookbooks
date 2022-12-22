# asdf R

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
asdf plugin-add R 'https://github.com/iroddis/asdf-R.git'
```

## Usage

```sh
#
asdf list-all R

#
R_CONFIGURE_OPTIONS=--with-x=no \
  asdf install R <version>

#
asdf global R <version>

#
asdf list R

#
asdf reshim R <version>
```
