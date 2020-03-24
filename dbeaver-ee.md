# DBeaver Enterprise

## App

### Dependencies

#### Darwin

- [Java SE Development Kit](https://www.oracle.com/technetwork/java/javase/downloads)

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

### Installation

#### Homebrew

```sh
brew cask install dbeaver-enterprise
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
