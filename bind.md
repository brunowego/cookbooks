# BIND

## Installation

### Homebrew

```sh
brew install bind
```

### YUN

```sh
yum check-update
sudo yum -y install bind
```

### APT

```sh
sudo apt update
sudo apt -y install bind9
```

### APK

```sh
sudo apk update
sudo apk add bind
```

<!-- ## Services

### Linux

```sh
sudo systemctl enable --now rpcbind
sudo systemctl enable --now rpc-statd
``` -->

## Configuration

### Listen on

```sh
sudo sed -ri "/^\tlisten-on port 53/ s/127.0.0.1;/127.0.0.1; $(hostname -I | awk '{print $2}');/g" /etc/named.conf
```

### Allow query

```sh
sudo sed -ri "/^\tallow-query/s_localhost;_localhost; $(ip route | awk 'NR==3 {print $1}');_g" /etc/named.conf
```

#### Any

```sh
sudo sed -ri '/\tallow-query/ s/localhost/any/g' /etc/named.conf
```

### Forwarders

```sh
\n\tforwarders { 8.8.8.8; [ip-address]; };
```
