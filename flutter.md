# Flutter

## Examples

- [Timy app](https://github.com/janoodleFTW/timy-messenger)

## CLI

### Dependencies

#### Homebrew

```sh
brew install cocoapods
```

### Installation

#### Homebrew

```sh
brew install -v MiderWong/flutter/flutter
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Flutter
export PATH="/usr/local/opt/flutter/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
flutter -h
```

### Examples

#### Doctor

```sh
flutter doctor -v
```

##### Licenses

```sh
flutter doctor --android-licenses
```

#### Emulators

```sh
flutter emulators
```

```sh
flutter emulators --launch [emulator]
```

```sh
flutter emulators --create --name [name]
```

#### Config

```sh
flutter config --no-analytics
```

#### Create

```sh
flutter create [name]
```

#### Packages

```sh
flutter packages get
```

##### Update

```sh
flutter update-packages
```

#### Run

```sh
flutter run
```
