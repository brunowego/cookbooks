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

<!-- #### PKG

https://dbeaver.com/files/6.3.0/dbeaver-ee-6.3.0-installer.pkg -->

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
# Darwin
sed "/^-vmargs/i -vm\n$(dirname $(readlink -f $(which java)))" /Applications/DBeaverEE.app/Contents/Eclipse/dbeaver.ini
```
