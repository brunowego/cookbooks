# Android SDK

## Glossary

- Android Debug Bridge (ADB)
- Android Virtual Device (AVD)

## CLI

### Dependencies

- [OpenJDK](/openjdk.md) (v8)
- [Kernel-based Virtual Machine (KVM)](/kvm.md)

### Installation

#### Homebrew

```sh
brew install --cask android-sdk
```

#### Chocolatey

```sh
choco install -y android-sdk
```

#### Using Android Studio 🌟

1. Tools -> SDK Manager
2. Tab: SDK Tools
   - Check "Show Package Details"
3. Expand "Android SDK Command-line Tools (latest)"
   - Check "Android SDK Command-line Tools (latest)"
   - Click: Apply

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

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

### Bootstrap

#### Install Packages

```sh
# Installed packages
sdkmanager --list | awk '/Installed/{flag=1; next} /Available/{flag=0} flag'

# List packages
sdkmanager --list

# Install packages
sdkmanager \
  'build-tools;29.0.0' \
  'system-images;android-29;google_apis;x86_64' \
  'platforms;android-29'

# Uninstall packages
sdkmanager --uninstall '<package-1>' '<package-2>' # ...
```

#### Create Device

```sh
# List Devices
avdmanager list

# Create Device
echo 'no' | avdmanager create avd \
  -c 512M \
  -k 'system-images;android-29;google_apis;x86_64' \
  -n 'Pixel_3_API_29' \
  -f

# List AVDs
emulator -list-avds
# or
avdmanager list avds

# Configuration
# Darwin
cat << EOF > ~/.android/avd/Pixel_3_API_29.avd/config.ini
AvdId=Pixel_3_API_29
PlayStore.enabled=false
abi.type=x86_64
avd.ini.displayname=Pixel 3 API 29
avd.ini.encoding=UTF-8
disk.dataPartition.size=800M
fastboot.chosenSnapshotFile=
fastboot.forceChosenSnapshotBoot=no
fastboot.forceColdBoot=no
fastboot.forceFastBoot=yes
hw.accelerometer=yes
hw.arc=false
hw.audioInput=yes
hw.battery=yes
hw.camera.back=virtualscene
hw.camera.front=emulated
hw.cpu.arch=x86_64
hw.cpu.ncore=4
hw.dPad=no
hw.device.hash2=MD5:55acbc835978f326788ed66a5cd4c9a7
hw.device.manufacturer=Google
hw.device.name=pixel_3
hw.gps=yes
hw.gpu.enabled=yes
hw.gpu.mode=auto
hw.initialOrientation=Portrait
hw.keyboard=yes
hw.lcd.density=420
hw.lcd.height=1920
hw.lcd.width=1080
hw.mainKeys=no
hw.ramSize=1536
hw.sdCard=yes
hw.sensors.orientation=yes
hw.sensors.proximity=yes
hw.trackBall=no
image.sysdir.1=system-images/android-29/google_apis/x86_64/
runtime.network.latency=none
runtime.network.speed=full
sdcard.size=512M
showDeviceFrame=yes
skin.dynamic=yes
skin.name=pixel_3
skin.path=$HOME/Library/Android/sdk/skins/pixel_3
tag.display=Google APIs
tag.id=google_apis
vm.heapSize=256
EOF

# Delete
avdmanager delete avd \
  -n 'Pixel_3_API_29'
```

#### Running

```sh
#
emulator \
  -writable-system \
  -avd 'Pixel_3_API_29' \
  -no-audio \
  -no-boot-anim \
  -gpu off
```

#### Install ADB

```sh
# List Target
avdmanager list target

#
adb install ./app/build/outputs/apk/debug/app-x86_64-debug.apk
```

### Issues

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

**macOS:**

1. System Preferences
2. Network
3. Verify Services

#### TBD

```log
Warning: java.net.ConnectException: Operation timed out (Connection timed out)
```

TODO

#### Library Xml Schema

```log
Exception in thread "main" java.lang.NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema
	...
```

[Switch to OpenJDK 8](/openjdk.md#environment).

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

#### TBD

```log
adb: failed to install ./app/build/outputs/apk/debug/app-x86_64-debug.apk: Failure [INSTALL_FAILED_TEST_ONLY: installPackageLI]
```

TODO

#### TBD

```log
emulator: ERROR: AdbHostServer.cpp:102: Unable to connect to adb daemon on port: 5037
```

TODO

#### TBD

```log
Out of memory: Java heap space.
Please assign more memory to Gradle in the project's gradle.properties file.
```

```sh
echo 'org.gradle.jvmargs=-Xmx4096m' >> ./gradle.properties
```

#### TBD

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

### Uninstall

```sh
# Darwin
rm -fR ~/.android
rm -fR ~/Library/Android*
```
