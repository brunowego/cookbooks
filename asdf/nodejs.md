# asdf Node.js

## Dependencies

### Homebrew

```sh
brew install coreutils gpg
```

## Installation

```sh
asdf plugin-add nodejs 'https://github.com/asdf-vm/asdf-nodejs.git'

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
```

## Usage

```sh
#
asdf list-all nodejs

#
asdf install nodejs <version>

#
asdf global nodejs <version>

#
asdf list nodejs

#
asdf reshim nodejs <version>
```
