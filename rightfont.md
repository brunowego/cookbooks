# RightFont

## App

### Installation

#### Homebrew

```sh
brew cask install rightfont
```

### Tips

####

```sh
cp ~/Library/Application\ Support/Adobe/CoreSync/plugins/livetype/.r/.* ~/path/to/font/name

cd ~/path/to/font/name

find . -iname '.*' -exec realpath {} \; | rename 's/\.(.*)/$1/'
```
