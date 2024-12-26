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
