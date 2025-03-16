# Cursor

## Links

- [Main Website](https://cursor.com)

## App

### Installation

```sh
# Using Homebrew
brew install --cask cursor
```

### Configuration

```sh
# Darwin
mkdir -p "$HOME"/.cursor

ln -s "$HOME"/Library/Application\ Support/Cursor/User/settings.json "$HOME"/.cursor/settings.json
```

### Commands

```sh
cursor -h
```

### Settings

```sh
# Locally
cat ./.cursor/settings.json

# Globally
cat "$HOME"/.cursor/settings.json
```

### Isses

#### TBD

```log
It's not possible to change the commit message in X the middle of a rebase. Please complete the rebase operation and use interactive rebase instead.
```

<!-- ```sh
cat ./.git/REBASE_HEAD

rm -fR ./.git/REBASE_HEAD
``` -->

TODO

#### TBD

```log
Click to open in your editor
```

TODO
