# Node.js

## Dependencies

### Homebrew

```sh
brew install coreutils gpg
```

## Installation

```sh
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
```

## Version

```sh
asdf list-all nodejs
```

```sh
asdf install nodejs [version]
```

## Setting

```sh
asdf global nodejs [version]
```

```sh
asdf list nodejs
asdf reshim nodejs [version]
```
