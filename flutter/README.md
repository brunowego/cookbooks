# Flutter

<!--
Gruntfuggly.todo-tree
dotup.dart-data-class-generator
Nash.awesome-flutter-snippets
usernamehw.errorlens
kisstkondoros.vscode-gutter-preview
-->

<!--
https://www.fluttermix.com/
-->

<!--
https://github.com/yunweneric/flutter-open-ui
-->

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
- [Showcase](https://flutter.dev/showcase)

## Examples

- [Timy app](https://github.com/janoodleFTW/timy-messenger)

<!--
https://github.com/icapps/flutter-template

https://github.com/carlospsarmiento/CleanArchitecture_Flutter_Ecommerce
https://github.com/yunweneric/flutter-open-ui/tree/wallet_app
https://github.com/ahvvad/MotoRent
https://github.com/ahvvad/Bookly
https://github.com/mennamohamed97/Bubble_Chat
https://github.com/hwb06/Flutter_DatingList_RestApis
https://github.com/ShehanUdantha/clean_architecture_movie_app
https://github.com/lazycatlabs/flutter_auth_app
https://github.com/Sameera-Perera/Flutter-TDD-Clean-Architecture-E-Commerce-App

https://github.com/MuhadJasiR/Zybo

https://github.com/Sumat-Dev/flutter-bloc-news-app
-->

## Learn

- [10x Your Speed With Flutter](https://youtube.com/watch?v=8oIsZEhnqtA)

## CLI

### Dependencies

- [CocoaPods](/cocoapods.md)
- Android SDK
  - [Android Studio](/android/studio/README.md#application)
  - [CLI](/android/sdk/README.md#cli)
  - [Create Device](/android/emulator/x86_64.md#create-device)
- [Xcode](/apple/xcode/README.md)

### Installation

```sh
# Using Homebrew
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
flutter config --disable-analytics

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
  --org 'com.example' \
  --project-name '<org-name>' \
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
flutter devices

#
flutter emulators

# For iOS
flutter emulators --launch apple_ios_simulator
flutter run -d iphone

# For Android
flutter emulators --launch Medium_Phone_API_36
flutter run -d emulator-5554 # android

# For Web
flutter run -d web-server # chrome
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

#### Missing Simulator Runtimes

```log
Unable to get list of installed Simulator runtimes.
```

```sh
xcodebuild -downloadPlatform iOS
```

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
