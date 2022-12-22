# Android SSL Pinning

<!--
https://github.com/to0thl3ss/IoTLinks/blob/ae74a5f76caa2f8810977a98b5358d6ec01a475e/mobile/js-script-sslbypass.js

https://www.youtube.com/watch?v=UJCHNfuN9JE
https://www.youtube.com/watch?v=jAcac09PdNM
https://www.youtube.com/watch?v=hfmjpd0n3sM
https://www.youtube.com/watch?v=1721lyUtfYY
https://www.youtube.com/watch?v=o8IcTU_bwoU
https://www.youtube.com/watch?v=ENyEcwLaz-A

https://github.com/shroudedcode/apk-mitm

https://www.youtube.com/watch?v=S8Qt1dWfPjs

DST Root CA X3 root
-->

## Dependencies

- [Android SDK Platform-Tools](/android/platform-tools.md)
- [Frida](/frida.md)
- [objection](/objection.md)
- [Android Emulator](/android/emulator/README.md#qemu-system-emulator)
- [Burp Suite Community Edition (CE)](/portswigger/burp-suite-ce.md)
  - Install ["CA Certificate"](/portswigger/burp-suite-ce.md#install-android-ca-certificate) on Android Emulator

## Docs

- [TrustManager](https://developer.android.com/reference/javax/net/ssl/TrustManager)
- [Network security configuration](https://developer.android.com/training/articles/security-config)

## Glossary

- Android Package (APK)
- Man-in-the-Middle (MitM)

## Bypass (SSL Unpinning)

Make sure Android Emulator is running.

### Configuration

```sh
#
adb devices -l

#
export ANDROID_ARCH="$(adb shell getprop ro.product.cpu.abi)"
export FRIDA_VERSION="$(curl -s https://api.github.com/repos/frida/frida/releases/latest | grep tag_name | cut -d '"' -f 4)"

curl \
  -LO "https://github.com/frida/frida/releases/download/${FRIDA_VERSION}/frida-server-${FRIDA_VERSION}-android-${ANDROID_ARCH}.xz" && \
    unxz "./frida-server-${FRIDA_VERSION}-android-${ANDROID_ARCH}.xz"

#
mv "./frida-server-${FRIDA_VERSION}-android-${ANDROID_ARCH}" /tmp/frida-server-android
chmod +x /tmp/frida-server-android

#
adb push /tmp/frida-server-android /data/local/tmp
adb shell ls /data/local/tmp
```

### Install APK

```sh
#
adb install </path/to/file.apk>
```

### Setup

#### Run Frida Server

**Note:** Not working with Android API version greater than 23.

**Dependencies:** [Root access](/android/sdk/platform-tools.md#root-access)

```sh
# Need root
adb shell whoami | grep root

#
adb shell ./data/local/tmp/frida-server-android &

#
adb shell ps | grep frida-server-android
```

#### Proxy (MiTM) with Burp Suite CE

**Step 1:** Start proxy on Burp Suite CE

1. Proxy tab -> Options
2. Proxy Linters -> Edit current
3. Binding tab -> Bind to address
   - Specific Address: Select your current IP address
   - OK

**Step 2:** Configure "Manual Proxy" on Android Emulator

**Step 3:** Open browser and navigate to `http://burp`, download "CA Certificate" and install it on your device:

1. Settings -> Search "Certificate" -> Install certificates -> Downloads

#### SSL Unpinning

```sh
#
frida-ls-devices

#
frida-ps -Uai
# or
frida-ps -aiD <id>

#
objection -g '<package-identifier>' explore

#
android proxy set <proxy-ip> 8080

#
android sslpinning disable

#
jobs list
```

<!--
android hooking watch class <class>

frida -U -f <package-identifier> -l <script.js> --no-pause

objection patchapk -s <script.js> -o <output.apk> <package-identifier>

sudo apt -y install apksigner zipalign
-->

#### Bypass SSL Pinning

```sh
#
frida-ps -Uai
# or
frida-ps -aiD <id>

#
adb push ./burp.der /data/local/tmp/cert-der.crt

#
frida -U --codeshare pcipolloni/universal-android-ssl-pinning-bypass-with-frida -f com.application.zomato
```

### Issues

#### Device Not Connected

```log
* daemon not running; starting now at tcp:5037
* daemon started successfully
adb: device offline
```

```sh
#
adb connect 127.0.0.1:5555

# for NoxPlayer
adb connect 127.0.0.1:62001
```

#### SELinux Policy

```log
Unable to load SELinux policy from the kernel: Failed to open file ?/sys/fs/selinux/policy?: Permission denied
```

Try use Android API version 23 or lower.

#### Multiple Devices Connected

```log
adb: more than one device/emulator
```

```sh
#
adb devices -l

#
adb disconnect
```

#### TBD

```log
Unable to connect to the frida server: this feature requires an iOS Developer Disk Image to be mounted;
Failed to enumerate applications: this feature requires an iOS Developer Disk Image to be mounted;
run Xcode briefly or use ideviceimagemounter to mount one manually
```

Specify the device ID:

```sh
#
frida-ps -aiD emulator-5554
```

### Cleanup

```sh
#
frida-ps -Uai
# or
frida-ps -aiD <id>

#
adb uninstall <package-identifier>

#
adb disconnect 127.0.0.1:5555
```
