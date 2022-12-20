# Android Package Kit (also k.a. Android Application Package) (APK)

## Tools

- APK Downloader
  - [APK Tools](https://apk.tools/)
  - [APKPure](https://apkpure.com)
  - [GooglePlay](/googleplay.md)
  - [gplaydl](/gplaydl.md)
  - [Raccoon](/raccoon.md)
- Decompiler
  - [apktool](/apktool.md)
  - [jadx](/jadx.md)

## Tips

### App Password

1. [Google Account](https://myaccount.google.com)
2. Security -> Signing in to Google
3. App passwords
   - Select the app and device you want to generate the app password for.
   - Select app / Other (Custom name): `apk-downloader` -> Generate

## Issues

### Incompatible CPU

```log
Unfortunately, <AppName> has stopped.
```

```sh
# Debug
adb logcat
```

Download compatible APK with CPU support: `arm64-v8a`, `armeabi-v7a`, `x86` or `x86_64`.
