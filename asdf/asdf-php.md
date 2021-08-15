# asdf PHP (asdf-php)

## Dependencies

### Homebrew

```sh
brew install freetype bison bison27 gettext icu4c jpeg libiconv libpng openssl readline

#
brew install magrathealabs/mlabs/icu4c@58.1
```

## Installation

```sh
asdf plugin-add php 'https://github.com/odarriba/asdf-php.git'
```

## Usage

```sh
#
asdf list-all php

# Homebrew
PATH="$(brew --prefix bison)/bin:$PATH" \
  asdf install php [version]

# Linux
asdf install php [version]

#
asdf global php [version]

#
asdf list php

#
asdf reshim php [version]
```
