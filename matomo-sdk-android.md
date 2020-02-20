# Matomo SDK for Android

## Dependencies

- [Android SDK](/android-sdk.md#running)
- [Gradle](/gradle.md)

## App Example

```sh
git clone https://github.com/matomo-org/matomo-sdk-android.git matomo-sdk-android && cd "$_"
```

```sh
#
./gradlew tasks

#
./gradlew :example:clean :example:installDebug

#
adb install ./exampleapp/build/outputs/apk/debug/exampleapp-debug.apk
```
