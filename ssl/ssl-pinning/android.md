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

DST Root CA X3 root
-->

## Dependencies

- [Android SDK Platform-Tools](/android/platform-tools.md)
- [Frida](/frida.md)
- [NoxPlayer](/noxplayer.md)
- [Burp Suite Community Edition (CE)](/burp-suite-ce.md)

## Docs

- [TrustManager](https://developer.android.com/reference/javax/net/ssl/TrustManager)
- [Network security configuration](https://developer.android.com/training/articles/security-config)

## Glossary

- Man-in-the-Middle (MitM)

## Bypass (SSL Unpinning)

Make sure [NoxPlayer](/noxplayer.md) is running.

### Configuration

```sh
#
adb connect 127.0.0.1:62001

#
adb devices -l

#
ANDROID_ARCH="$(adb shell getprop ro.product.cpu.abi)"; \
FRIDA_VERSION="$(curl -s https://api.github.com/repos/frida/frida/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl \
    -LO "https://github.com/frida/frida/releases/download/${FRIDA_VERSION}/frida-server-${FRIDA_VERSION}-android-${ANDROID_ARCH}.xz" && \
      unxz "./frida-server-${FRIDA_VERSION}-android-x86.xz"

#
mv "./frida-server-${FRIDA_VERSION}-android-x86" ./frida-server-android-x86
chmod +x frida-server-android-x86

#
adb push ./frida-server-android-x86 /data/local/tmp
```

### Setup

#### Run Frida Server

```sh
#
adb shell ./data/local/tmp/frida-server-android-x86 &
```

#### MiTM with Burp Suite CE

1. Open Burp Suite CE
2. Proxy Tab -> Options
3. Proxy Linters -> Edit Current
4. Binding Tab -> Bind to address
   - Specific Address: Select your current IP address
   - OK

#### SSL Unpinning

```sh
#
frida-ls-devices

#
frida-ps -Uai

#
objection -g <package-identifier> explore

#
android proxy set <proxy-ip> 8080
android sslpinning disable
```

<!--
avdmanager
-->

### Shutdown

```sh
# Darwin
osascript -e 'quit app "NoxAppPlayer"'
```
