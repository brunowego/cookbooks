# Network Time Protocol (NTP)

**Keywords:** Time zone, Local time, Zone info

## CLI

### Installation

#### Homebrew

```sh
brew install ntp
```

#### APT

```sh
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -y install ntp
```

### Configuration

```sh
#
cat /etc/ntp.conf
```

### Service

```sh
# Linux
sudo systemctl enable --now ntp
```

### Usage

```sh
#
ntpq -p
```

### Tips

#### Local Time

```sh
#
date

#
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

#
date
```

<!--
timedatectl set-ntp yes
-->
