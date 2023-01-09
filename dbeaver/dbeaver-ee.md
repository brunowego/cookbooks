# DBeaver Enterprise Edition (EE)

## App

### Dependencies

- [OpenJDK JRE - Java Runtime Environment](/openjdk-jre.md)

#### Darwin

- [Java SE Development Kit](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)

### Installation

#### Homebrew

```sh
brew install --cask dbeaver-enterprise
```

#### DMG

##### 6.3.0

```sh
hdiutil attach https://dbeaver.com/files/6.3.0/dbeaver-ee-6.3.0-macos.dmg \
  -nobrowse \
  -mountpoint \
  /Volumes/DBeaverEE

#
cp -R /Volumes/DBeaverEE/DBeaverEE.app /Applications

#
hdiutil detach /Volumes/DBeaverEE
```

<!--
open /Applications/DBeaverEE.app
-->

#### RPM

```sh
curl -LO https://dbeaver.com/files/dbeaver-ee-latest-stable.x86_64.rpm

sudo rpm -vi dbeaver-ee-latest-stable.x86_64.rpm && rm -f dbeaver-ee-latest-stable.x86_64.rpm
```

#### DPKG

```sh
curl -LO https://dbeaver.com/files/dbeaver-ee_latest_amd64.deb

sudo dpkg -i dbeaver-ee_latest_amd64.deb && rm -f dbeaver-ee_latest_amd64.deb
```

#### Chocolatey

```sh
choco install -y dbeaver-ee
```

### Issues

#### Missing JVM

```log
Failed to create the Java Virtual Machine.
```

```sh
#
brew install --cask adoptopenjdk8

#
sed -i "/^-vmargs/i -vm\n/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin" /Applications/DBeaverEE.app/Contents/Eclipse/dbeaver.ini
```
