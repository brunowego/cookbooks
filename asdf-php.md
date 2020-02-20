# PHP

## Dependencies

### Homebrew

```sh
brew install freetype bison bison27 gettext icu4c jpeg libiconv libpng openssl readline

#
brew install magrathealabs/mlabs/icu4c@58.1
```

## Installation

```sh
asdf plugin-add php https://github.com/odarriba/asdf-php.git
```

## Version

```sh
asdf list-all php
```

### Homebrew

#### Version 7.x

```sh
PATH="$(brew --prefix bison)/bin:$PATH" \
  asdf install php [version]
```

### Linux

```sh
asdf install php [version]
```

## Setting

```sh
asdf global php [version]
```

```sh
asdf list php
asdf reshim php [version]
```
