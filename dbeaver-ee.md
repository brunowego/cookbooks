# DBeaver Enterprise

## App

### Dependencies

#### Darwin

- [Java SE Development Kit](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)

#### YUM

```sh
yum check-update
sudo yum -y install java-1.8.0-openjdk
```

#### APT

```sh
sudo apt update
sudo apt -y install openjdk-8-jre
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y java-1_8_0-openjdk
```

### Installation

#### Homebrew

```sh
brew cask install dbeaver-enterprise
```

#### DMG

```sh
hdiutil attach https://dbeaver.com/files/6.3.0/dbeaver-ee-6.3.0-macos.dmg -nobrowse -mountpoint /Volumes/DBeaverEE
```

```sh
cp -R /Volumes/DBeaverEE/DBeaverEE.app /Applications
```

```sh
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
