# Android SDK Platform-Tools

## CLI

### Installation

#### Homebrew

```sh
brew cask install android-platform-tools
```

### Commands

```sh
adb help
```

### Examples

```sh
# List Devices
adb devices

# Shell
adb shell
adb shell [command]
```

### Tips

#### Logs

```sh
adb wait-for-device shell logcat
```

#### Writable System

```sh
#
emulator -list-avds

#
emulator \
  -writable-system \
  -avd Pixel_2_API_28 \
  -no-snapshot-load \
  -partition-size 1024 \
  &> /dev/null &

##
adb reboot -writable-system
```

```sh
#
adb disable-verity
adb reboot
adb wait-for-device root
adb remount
```

#### Hosts

First, enable Writable System.

```sh
#
adb shell cat /etc/hosts

# Option 1
adb shell 'echo "[ip]\t[domain]" >> /system/etc/hosts'

# Option 2
adb pull /system/etc/hosts ./hosts
echo '[ip]\t[domain]' >> ./hosts
adb push ./hosts /system/etc/hosts
rm ./hosts

#
adb unroot
```

#### Root CA

<!-- ##### Option 1

First, enable Writable System.

```sh
adb shell ls /system/etc/security/cacerts
```

```sh
export CERT_PATH='/etc/ssl/certs/example.com/ca/rootCA.pem'
export CERT_HASH="$(openssl x509 -inform PEM -in "$CERT_PATH" -subject_hash_old | head -n 1)"

adb push "$CERT_PATH" "/system/etc/security/cacerts/$CERT_HASH.0"

adb reboot
``` -->

##### Option 2

```sh
adb push \
  /etc/ssl/certs/example.com/ca/rootCA.pem \
  /sdcard/rootCA.pem
```

1. Settings
2. Security & Location
3. Screen lock
   - PIN -> YES -> Type: 1111 -> NEXT -> Repeat: 1111 -> CONFIRM
   - Show all notification content -> DONE
4. Advanced -> Encruption & credentials
5. Install from SD card
6. Open from -> AOSP on IA Emulator
7. Click: `server.pem`
   - Certificate name: Example
8. User credentials
