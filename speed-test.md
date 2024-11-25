# Speed Test

## CLI

### Links

- [Main Website](https://speedtest.net/apps/cli)

### Installation

```sh
# Using Homebrew
brew install speedtest-cli

# Using APT
curl -s 'https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh' | sudo bash
sudo apt -y install speedtest

# Using YUM
curl -s 'https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.rpm.sh' | sudo bash
sudo yum -y install speedtest

# PUsing KG
sudo pkg update
sudo pkg install -gy libidn2 ca_root_nss

cat /etc/os-release

sudo pkg add 'https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-freebsd12-x86_64.pkg' # FreeBSD 12
sudo pkg add "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-freebsd13-x86_64.pkg" # FreeBSD 13

# Using Chocolatey
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

### Issues

#### TBD

```log
Retrieving speedtest.net configuration...
Cannot retrieve speedtest configuration
ERROR: HTTP Error 403: Forbidden
```

TODO
