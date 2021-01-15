# Antigen

## CLI

### Installation

#### Homebrew

```sh
brew install antigen
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Antigen
source /usr/local/share/antigen/antigen.zsh
```

### Commands

```sh
antigen help
```

### Usage

```sh
# List
antigen list

# Use Oh My Zsh
antigen use oh-my-zsh

# Install Bundle
antigen bundle [package]

antigen bundle command-not-found

antigen bundle osx
antigen bundle ubuntu
antigen bundle debian
antigen bundle archlinux

# Theme
antigen theme wedisagree

# Apply
antigen apply
```
