# Android SDK

## CLI

### Dependencies

- [OpenJDK](/openjdk.md)
- [Kernel-based Virtual Machine (KVM)](/kvm.md)

### Installation

#### Android Studio

1. Navigation Bar -> SDK Manager
2. Tab: SDK Tools
3. Select: Android SDK Tools
4. Click: Apply

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk" # Homebrew
export ANDROID_HOME="$HOME/Android/Sdk" # Linux
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
emulator -help
avdmanager -h
```

### Running

```sh
# Licenses
yes | sdkmanager --licenses

# List Packages
sdkmanager --list

# Install Packages
sdkmanager \
  'tools' \
  'platform-tools' \
  'build-tools;28.0.0' \
  'system-images;android-28;google_apis;x86_64' \
  'platforms;android-28'

# List Devices
avdmanager list

# Create Device
echo 'no' | avdmanager create avd \
  -c 512M \
  -k 'system-images;android-28;google_apis;x86_64' \
  -n 'Pixel_2_API_28' \
  -f

# List AVD's
emulator -list-avds

# Configuration
# Darwin
cat << EOF > ~/.android/avd/Pixel_2_API_28.avd/config.ini
AvdId=Pixel_2_API_28
PlayStore.enabled=false
abi.type=x86_64
avd.ini.displayname=Pixel 2 API 28
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
hw.device.name=pixel_2
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
image.sysdir.1=system-images/android-28/google_apis/x86_64/
runtime.network.latency=none
runtime.network.speed=full
sdcard.size=512M
showDeviceFrame=yes
skin.dynamic=yes
skin.name=pixel_2
skin.path=$HOME/Library/Android/sdk/skins/pixel_2
tag.display=Google APIs
tag.id=google_apis
vm.heapSize=256
EOF

# Running
emulator \
  -writable-system \
  -avd 'Pixel_2_API_28' \
  -no-audio \
  -no-boot-anim \
  -gpu off
```

```sh
# List Target
android list target

#
./gradlew tasks

#
adb install ./app/build/outputs/apk/debug/app-x86_64-debug.apk
```

```sh
# Delete
avdmanager delete avd \
  -n 'Pixel_2_API_28'
```

### Issues

#### Library Xml Schema

```log
Exception in thread "main" java.lang.NoClassDefFoundError: javax/xml/bind/annotation/XmlSchema
	at com.android.repository.api.SchemaModule$SchemaModuleVersion.<init>(SchemaModule.java:156)
	at com.android.repository.api.SchemaModule.<init>(SchemaModule.java:75)
	at com.android.sdklib.repository.AndroidSdkHandler.<clinit>(AndroidSdkHandler.java:81)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:73)
	at com.android.sdklib.tool.sdkmanager.SdkManagerCli.main(SdkManagerCli.java:48)
Caused by: java.lang.ClassNotFoundException: javax.xml.bind.annotation.XmlSchema
	at java.base/jdk.internal.loader.BuiltinClassLoader.loadClass(BuiltinClassLoader.java:583)
	at java.base/jdk.internal.loader.ClassLoaders$AppClassLoader.loadClass(ClassLoaders.java:178)
	at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:521)
	... 5 more
```

[Switch to OpenJDK 8](/openjdk.md#environment).

#### Device with API

```log
adbd cannot run as root in production builds
```

1. Tools
2. AVD Manager
3. Create Virtual Device...
4. Select: Pixel 2 -> Next
5. Tab: x86 Images
6. Select: Nougat (Google APIs) -> Next
7. Finish

####

```log
adb: failed to install ./app/build/outputs/apk/debug/app-x86_64-debug.apk: Failure [INSTALL_FAILED_TEST_ONLY: installPackageLI]
```

TODO

####

```log
emulator: ERROR: AdbHostServer.cpp:102: Unable to connect to adb daemon on port: 5037
```

TODO

####

```log
Out of memory: Java heap space.
Please assign more memory to Gradle in the project's gradle.properties file.
```

```sh
echo 'org.gradle.jvmargs=-Xmx4096m' >> ./gradle.properties
```

####

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
