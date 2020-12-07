# Flutter

<!--
https://app.pluralsight.com/library/courses/flutter-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/flutter-big-picture/table-of-contents
https://app.pluralsight.com/library/courses/creating-layouts-flutter/table-of-contents
https://app.pluralsight.com/library/courses/creating-connected-app-flutter/table-of-contents
https://app.pluralsight.com/library/courses/flutter-creating-localized-apps/table-of-contents
https://app.pluralsight.com/library/courses/codemash-session-74/table-of-contents
https://app.pluralsight.com/library/courses/droidcon-nyc-session-46/table-of-contents
https://app.pluralsight.com/library/courses/managing-state-flutter/table-of-contents
https://app.pluralsight.com/library/courses/droidcon-sf-session-77/table-of-contents
https://app.pluralsight.com/library/courses/persisting-data-locally-flutter/table-of-contents
https://app.pluralsight.com/library/courses/droidcon-sf-session-66/table-of-contents
https://app.pluralsight.com/library/courses/droidcon-sf-session-28/table-of-contents

https://www.linkedin.com/learning/flutter-part-01-introduction/what-is-flutter
-->

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

### Usage

```sh
# Doctor
flutter doctor -v

# Licenses
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
