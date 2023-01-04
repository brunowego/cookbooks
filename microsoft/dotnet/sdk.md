# .NET SDK

## Links

- [Main Website](https://dot.net/sdk)
- [Download](https://aka.ms/dotnet/download)

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
export DOTNET_CLI_TELEMETRY_OPTOUT=1
```

<!--
export PATH="$PATH:$HOME/.dotnet/tools" # Homebrew
-->

```sh
sudo su - "$USER"
```

### Usage

```sh
#
dotnet --info

# List templates
dotnet new list

# New project
dotnet new <template> -n <name> && cd "$_"

#
open ./<name>.csproj

#
dotnet build \
  -c Release \
  -r osx-x64 \
  --sc
# osx-x64, linux-x64, win10-x64

#
dotnet run --urls http://+:5000

#
dotnet tool install -g <package>
```
