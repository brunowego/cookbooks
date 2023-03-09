# Android SDK

## Glossary

- Android Debug Bridge (ADB)
- Android Virtual Device (AVD)

## CLI

### Dependencies

- [OpenJDK](/openjdk/README.md) (v8)
- Linux
  - [Kernel-based Virtual Machine (KVM)](/kvm.md)

### Installation

#### Using Android Studio 🌟

1. Tools -> SDK Manager
2. Tab: SDK Tools
   - Check "Show Package Details"
3. Expand "Android SDK Command-line Tools (latest)"
   - Check "Android SDK Command-line Tools (latest)"
   - Click: Apply

#### Homebrew

```sh
brew install --cask android-sdk
```

#### Chocolatey

```sh
choco install -y android-sdk
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

#### Using Android Studio

```sh
# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk" # for Homebrew
# export ANDROID_HOME="$HOME"/Android/Sdk # for Linux
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH"
```

```sh
sudo su - "$USER"
```

#### Using Homebrew

```sh
# Android SDK
export ANDROID_HOME='/usr/local/share/android-sdk'
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
emulator -help
sdkmanager --help
avdmanager -h
```

### Configuration

```sh
# Licenses
yes | sdkmanager --licenses

#
sdkmanager --update
```

### Usage

```sh
#
adb shell getprop
```

### Issues

#### TBD

```log
avb_ops_user.cpp:217: ERROR: Error writing data.
avb_user_verity.c:205: ERROR: Error writing to partition 'vbmeta'
Skipping /system for remount
[liblp]bool android::fs_mgr::WritePrimaryMetadata(int, const android::fs_mgr::LpMetadata &, uint32_t, const std::string &, const std::function<bool (int, const std::string &)> &) write 740 bytes failed: Operation not permitted
[libfs_mgr]add partition scratch
[liblp]bool android::fs_mgr::WritePrimaryMetadata(int, const android::fs_mgr::LpMetadata &, uint32_t, const std::string &, const std::function<bool (int, const std::string &)> &) write 740 bytes failed: Operation not permitted
[libfs_mgr]add partition scratch
[liblp]bool android::fs_mgr::WritePrimaryMetadata(int, const android::fs_mgr::LpMetadata &, uint32_t, const std::string &, const std::function<bool (int, const std::string &)> &) write 740 bytes failed: Operation not permitted
[libfs_mgr]add partition scratch
Can not mount overlayfs for partitions: No such file or directory
failed to remount partition dev:/dev/block/dm-3 mnt:/vendor: Permission denied
failed to remount partition dev:/dev/block/dm-2 mnt:/product: Permission denied
failed to remount partition dev:/dev/block/dm-1 mnt:/system_ext: Permission denied
remount failed
```

TODO

#### Missing Android Home Binary Files

```log
[4527752704]:ERROR:android/android-emu/android/qt/qt_setup.cpp:28:Qt library not found at ../emulator/lib64/qt/lib
Could not launch '<user>/test/../emulator/qemu/darwin-x86_64/qemu-system-x86_64': No such file or directory
```

Missing `cmdline-tools`, `emulator`, `platform-tools`, binary path in environment `$PATH`.

#### Cache Conflict Between Versions

```log
Warning: Mapping new ns http://schemas.android.com/repository/android/common/02 to old ns http://schemas.android.com/repository/android/common/01
```

```log
org.xml.sax.SAXParseException; lineNumber: 141; columnNumber: 252; cvc-complex-type.2.4.a: Invalid content was found starting with element 'base-extension'. One of '{layoutlib}' is expected.
	...
```

[Uninstall](#uninstall) Android Studio and try a fresh install.

#### Behind Proxy

```log
Exception in thread "main" java.lang.NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema
	...
Caused by: java.lang.ClassNotFoundException: javax.xml.bind.annotation.XmlSchema
	...
```

**Option 1:**

- macOS
  1. System Preferences
  2. Network
  3. Verify Services

**Option 2:** `jabba alias default openjdk@1.9.0`

#### TBD1

```log
Warning: java.net.ConnectException: Operation timed out (Connection timed out)
```

TODO

#### Library Xml Schema

```log
Exception in thread "main" java.lang.NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema
	...
```

[Switch to OpenJDK 8](/openjdk/README.md#environment).

#### Device with API

```log
adbd cannot run as root in production builds
```

1. Tools
2. AVD Manager
3. Create Virtual Device...
4. Select: Pixel 3 -> Next
5. Tab: x86 Images
6. Select: Nougat (Google APIs) -> Next
7. Finish

#### TBD2

```log
emulator: ERROR: AdbHostServer.cpp:102: Unable to connect to adb daemon on port: 5037
```

TODO

#### TBD3

```log
Out of memory: Java heap space.
Please assign more memory to Gradle in the project's gradle.properties file.
```

```sh
echo 'org.gradle.jvmargs=-Xmx4096m' >> ./gradle.properties
```

#### TBD4

```sh
Execution failed for task ':app:validateSigningRelease'.
> Keystore file /xxx/android/app/my-release-key.keystore not found for signing config 'release'.
```

```sh
#
keytool \
  -keypass PASSWORD1 \
  -storepass PASSWORD2 \
  -genkeypair \
  -v \
  -keystore ./app/release.keystore \
  -alias release \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000

#
Example
IT Department
Example Inc.
Sao Paulo
Sao Paulo
BR
yes

#
cat << EOF >> ./keystore.properties
keyAlias=release
keyPassword=PASSWORD1
storeFile=release.keystore
storePassword=PASSWORD2

EOF
```

#### Invalid Certificate (PKIX)

```log
Warning: Failed to download any source lists!
Warning: IO exception while downloading manifest
Warning: IO exception while downloading manifest
Warning: Still waiting for package manifests to be fetched remotely.
```

```sh
#
sdkmanager --list --verbose
```

```log
Info: javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
```

```sh
# Try
jabba use openjdk@1.17.0
```

### Uninstall

```sh
# Darwin
rm -fR ~/.android
rm -fR ~/Library/Android*
```
