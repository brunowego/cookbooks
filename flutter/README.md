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

https://linkedin.com/learning/flutter-part-01-introduction/what-is-flutter

https://github.com/fikretsengul/flutter_advanced_boilerplate
-->

## Links

- [Code Repository](https://github.com/flutter/flutter)
- [Main Website](https://flutter.dev)

## Examples

- [Timy app](https://github.com/janoodleFTW/timy-messenger)

## CLI

### Dependencies

- [CocoaPods](/cocoapods.md)
- [Android SDK](/android/android-sdk.md)

<!-- brew install ideviceinstaller ios-deploy -->

### Installation

#### Homebrew

```sh
brew install --cask flutter
```

<!-- ### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Flutter
export PATH="/usr/local/opt/flutter/bin:$PATH"
```

```sh
sudo su - "$USER"
``` -->

### Commands

```sh
flutter -h
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# For Brave Browse
export CHROME_EXECUTABLE='/Applications/Brave Browser.app/Contents/MacOS/Brave Browser'
# or, Brave Browser Dev
export CHROME_EXECUTABLE='/Applications/Brave Browser Dev.app/Contents/MacOS/Brave Browser Dev'
```

```sh
source ~/.zshrc
```

### Configuration

```sh
#
flutter config --no-analytics

#
flutter config --android-sdk "$ANDROID_SDK_ROOT"

#
flutter doctor -v

# Licenses
flutter doctor --android-licenses
```

### Usage

```sh
#
flutter packages get

#
flutter pub get
pod install --project-directory=./ios

#
flutter clean

#
flutter analyze

#
flutter test

#
flutter build ios-framework --xcframework --

# Emulators
flutter emulators
flutter emulators --launch <emulator>
flutter emulators \
  --create \
  --name <name>

# Create
flutter create <name>

# Packages
flutter packages get

# Update
flutter update-packages

# Run
flutter run
```

<!--
flutter build appbundle --build-number=42$GITHUB_RUN_NUMBER
flutter build ipa --build-number=42$GITHUB_RUN_NUMBER
-->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension Dart-Code.flutter

#
jq '."recommendations" += ["Dart-Code.flutter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
