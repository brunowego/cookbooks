# Flutter Version Management (fvm)

## Links

- [Code Repository](https://github.com/leoafarias/fvm)
- [Main Website](https://fvm.app)

## CLI

### Installation

```sh
# Using Homebrew
brew tap leoafarias/fvm
brew install fvm
```

### Commands

```sh
fvm -h
```

### Environment (Unix-like Only)

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# fvm
export PATH="$HOME/fvm/default/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Usage

```sh
#
fvm releases

#
fvm install <version>

#
fvm list

#
fvm use <version>

#
fvm global <version>

#
fvm doctor
```
