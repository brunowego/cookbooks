# Flutter

<!--
https://globe.dev | https://github.com/invertase/globe
-->

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

https://github.com/bizz84/flutter-tips-and-tricks
-->

**Keywords:** Mobile Cross Platform

## Links

- [Code Repository](https://github.com/flutter/flutter)
- [Main Website](https://flutter.dev)

## Examples

- [Timy app](https://github.com/janoodleFTW/timy-messenger)

## CLI

### Dependencies

- [CocoaPods](/cocoapods.md)
- Android SDK
  - [CLI](/android/sdk/README.md#cli)
  - [Create Device](/android/sdk/README.md#create-device)

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
# Flutter
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

# Android
flutter config --android-sdk "$ANDROID_SDK_ROOT"
flutter doctor --android-licenses

#
flutter channel stable # master, dev, beta

#
flutter doctor
# or, with verbose
flutter doctor -v

#
flutter upgrade

#
cat ~/.flutter
```

<!--
#
flutter downgrade
-->

### Bootstrap

```sh
#
flutter create \
  --org 'com.example.myapp' \
  --project-name 'myapp' \
  --platforms android,ios \
  -t app \
  ./
```

### Usage

```sh
#
flutter analyze

#
flutter clean

#
flutter build apk
flutter build ios
flutter build aar

#
flutter test
flutter test -d <device-id> -r <reporter>

#
flutter emulators
flutter emulators --launch apple_ios_simulator
flutter emulators --launch Pixel_3a_API_33_x86_64

#
flutter devices

#
flutter run -d web-server # chrome
flutter run -d android
flutter run -d iphone
```

### Tips

#### Set SDK Version

<!--
https://github.com/flutter/flutter/issues/115904
https://github.com/flutter/flutter/issues/95533#issuecomment-1051489232
-->

**Refer:** `./android/local.properties`

```properties
# ...

flutter.minSdkVersion=21
flutter.targetSdkVersion=31
flutter.compileSdkVersion=31
```

#### Visual Studio Code

```sh
#
code --install-extension Dart-Code.flutter

#
jq '."recommendations" += ["Dart-Code.flutter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### TBD

```log
w: Runtime JAR files in the classpath should have the same version. These files were found in the classpath:
    ...
w: Some runtime JAR files in the classpath have an incompatible version. Consider removing them from the classpath
```

TODO

<!-- ```sh
#
rm -fR ~/.gradle/caches

#
flutter clean

#
( cd android && ./gradlew clean )
``` -->

#### TBD

```log
Execution failed for task ':shared_preferences_android:generateReleaseRFile'.
> A failure occurred while executing com.android.build.gradle.internal.res.GenerateLibraryRFileTask$GenerateLibRFileRunnable
   > ~/.gradle/caches/transforms-3/3bcdaf5e019888e2b567be88bb46bb6f/transformed/androidx.fragment-r.txt
```

TODO

#### Missing Required Android SDK Version

```log
[!] Android toolchain - develop for Android devices (Android SDK version 28.0.3)
    ...
    ✗ Flutter requires Android SDK 29 and the Android BuildTools 28.0.3
    ...
```

```sh
sdkmanager \
  'build-tools;29.0.0' \
  'platforms;android-29'
```

#### TBD

```log
The Android emulator exited with code 1 during startup
Android emulator stderr:
PANIC: Broken AVD system path. Check your ANDROID_SDK_ROOT value [/usr/local/share/android-sdk]!
```

TODO
