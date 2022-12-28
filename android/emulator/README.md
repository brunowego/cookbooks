# Android Emulator

## Docs

- [Emulator](https://developer.android.com/studio/run/emulator)

## Glossary

- Android Virtual Device (AVD)
- Quick Emulator (QEMU)

## Providers

- [Android Studio / QEMU System Emulator](#qemu-system-emulator) 🌟
- [BlueStacks](/bluestacks.md)
- [Genymotion](/genymotion.md)
- [NoxPlayer](/noxplayer.md)

## QEMU System Emulator

- [x86](./x86.md)
- [x86_64](./x86_64.md)

## Issues

### Wrong Architecture

```sh
adb: failed to install <filename>.apk: Failure [INSTALL_FAILED_NO_MATCHING_ABIS: Failed to extract native libraries, res=-113]
```

Check if the architecture of the emulator is the same as the APK.

```sh
#
adb shell getprop ro.product.cpu.abi
```

#### TBD

```log
adb: failed to install ./app/build/outputs/apk/debug/app-x86_64-debug.apk: Failure [INSTALL_FAILED_TEST_ONLY: installPackageLI]
```

TODO

### TBD

```log
INFO    | Critical: Failed to load https://maps.googleapis.com/maps/api/mapsjs/gen_204?csp_test=true: The 'Access-Control-Allow-Origin' header has a value 'qrc://' that is not equal to the supplied origin. Origin 'qrc://' is therefore not allowed access. (qrc:/html/js/location-mock-web-channel.js:0, (null))
```

TODO

### Couldn't Sign In

```log
There was a problem communicating with Google server. Try again later.
```

TODO
