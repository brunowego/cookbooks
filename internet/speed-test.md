# Internet Speed Test

## CLI

### Links

- [Main Website](https://speedtest.net/apps/cli)

### Installation

#### Homebrew

```sh
brew tap teamookla/speedtest
brew install speedtest
```

#### APT

```sh
curl -s 'https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh' | sudo bash
sudo apt -y install speedtest
```

#### YUM

```sh
curl -s 'https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh' | sudo bash
sudo yum -y install speedtest
```

#### PKG

```sh
sudo pkg update
sudo pkg install -gy libidn2 ca_root_nss

cat /etc/os-release

sudo pkg add 'https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-freebsd12-x86_64.pkg' # FreeBSD 12
sudo pkg add "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-freebsd13-x86_64.pkg" # FreeBSD 13
```

#### Chocolatey

```sh
choco install -y speedtest
```

### Commands

```sh
speedtest -h
```

### Usage

```sh
#
speedtest
```
