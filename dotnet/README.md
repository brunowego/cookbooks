# .NET

<!--
https://www.hangfire.io/
FROM docker.io/microsoft/dotnet:2.2-sdk AS build
-->

## CLI

### Installation

#### Homebrew

```sh
brew install --cask dotnet-sdk
```

### Commands

```sh
dotnet -h
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# .NET SDK
export PATH="$PATH:$HOME/.dotnet/tools" # Homebrew
```

```sh
sudo su - "$USER"
```

### Usage

```sh
#
dotnet --info

#
dotnet tool install -g [package]
```
