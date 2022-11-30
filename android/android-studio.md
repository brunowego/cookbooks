# Android Studio (IntelliJ IDEA)

## References

- [AVD Manager](https://developer.android.com/studio/run/managing-avds)
- [Emulator](https://developer.android.com/studio/run/emulator)
- [Android Studio download archives](https://developer.android.com/studio/archive)

## App

### Installation

#### Homebrew

```sh
brew install --cask android-studio
```

#### Snappy

```sh
sudo snap install android-studio --classic
```

<!-- #### APT

```sh
wget -O - 'https://dl.google.com/dl/android/studio/ide-zips/3.5.2.0/android-studio-ide-191.5977832-linux.tar.gz' | \
  tar -xz
``` -->

#### Chocolatey

```sh
choco install -y androidstudio
```

### Configuration

```sh
# Darwin
open -a /Applications/Android\ Studio.app
```

#### Wizard

1. Welcome -> Next
2. Install Type -> Select: Custom -> Next
3. Select default JDK Location -> Next
4. Select UI Theme -> Select: Darcula -> Next
5. SDK Components Setup -> Check: Android Virtual Device -> Next
6. Emulator Settings -> RAM allocation: 8,192 -> Next
7. Verify Settings -> Finish
8. License Agreement -> Accept -> Finish
9. Downloading Components -> Finish

#### Launcher (Darwin)

1. Open an existing Android Studio project
2. Tools
3. Create Command-Line Launcher... -> Ok

### Usage

```sh
# Open Current Project
studio ./
```

### Tips

#### Proxy

1. Preferences (Darwin)/Settings (Linux)
2. Appearance & Behavior
3. System Settings
4. HTTP Proxy
5. Check and configure: Manual proxy configuration -> Ok
6. Sync Project with Gradle Files

### Issues

#### Android Studio First Run

```log
Unable to access Android SDK add-on list
```

```sh
# macOS
trash ~/Library/Application\ Support/Google/AndroidStudio*

echo '\ndisable.android.first.run = true' >> /Applications/Android\ Studio.app/Contents/bin/idea.properties
```

#### Missing SDK

```log
SDK tools directory is missing
```

Configure proxy settings and try again.

#### Filesystem Case-Sensitivity Mismatch

```log
The project seems to be located on a case-sensitive file system.
This does not match the IDE setting (controlled by property "idea.case.sensitive.fs")
```

```sh
echo 'idea.case.sensitive.fs=true' >> /Applications/Android\ Studio.app/Contents/bin/idea.properties
```

### Issues

#### Insufficient Storage

```log
Installation did not succeed.
The application could not be installed: INSTALL_FAILED_INSUFFICIENT_STORAGE
The device needs more free storage to install the application (extra space is needed in addition to APK size).
```

```sh
adb shell df -h
adb shell du /data
adb shell pm clear com.android.providers.media
```

#### Trust Anchors

Add to `./app/src/main/AndroidManifest.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest>
    <application>
        <activity
            <...>
            android:networkSecurityConfig="@xml/network_security_config"></activity>
    </application>
</manifest>
```

Add to `./app/src/main/res/xml/network_security_config.xml`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <...>
    <domain-config cleartextTrafficPermitted="true">
        <domain includeSubdomains="true">app.example.com</domain>
        <trust-anchors>
            <certificates src="user" />
        </trust-anchors>
    </domain-config>
</network-security-config>
```

### Uninstall

```sh
# Homebrew
brew uninstall --cask android-studio

rm -fR ~/.android
rm -fR ~/Library/Android
rm -fR ~/Library/Application\ Support/Google/AndroidStudio*
```
