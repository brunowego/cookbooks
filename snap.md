# Snappy (snap)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install snapd
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install snapd
```

### Configuration

#### Non debian like

```sh
sudo ln -s /var/lib/snapd/snap /snap
```

### Service

```sh
sudo systemctl enable --now snapd.socket
```

```sh
sudo su - "$USER"
```

### Commands

```sh
snap help
```

### Tips

#### Proxy

```sh
sudo snap set system proxy.http="$http_proxy"
sudo snap set system proxy.https="$http_proxy"
```
