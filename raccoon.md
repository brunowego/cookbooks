# Raccoon

<!--
https://github.com/DatGizmo/scripts/blob/master/raccoon
-->

**Keywords:** APK Downloader

## Links

- [Main Website](https://raccoon.onyxbits.de/)
- [Downloads](https://raccoon.onyxbits.de/downloads/)

## App

### Dependencies

- Set [App Password](/android/apk.md#app-password)

### Installation

#### Darwin

```sh
#
wget -O /usr/local/bin/raccoon.jar https://raccoon.onyxbits.de/apk-downloader/raccoon-4.23.0.jar

cat << EOF > /usr/local/bin/raccoon
#! /bin/bash

export JAVA_HOME="${JAVA_HOME:-/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home}"

"${JAVA_HOME}/bin/java" -Draccoon.home="$HOME/.raccoon" -jar '/usr/local/bin/raccoon.jar'
EOF

chmod +x /usr/local/bin/raccoon
```

### Opening

```sh
raccoon
```

<!-- ### Usage

```sh
adb install ~/.raccoon/content/apps/<class-name>

#
adb uninstall <package-name>
```
