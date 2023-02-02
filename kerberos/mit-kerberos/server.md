# MIT Kerberos Server

## Ports

| Service      | Port |
| ------------ | ---- |
| KDC          | 88   |
| Admin Server | 749  |

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install krb5-admin-server
```

#### YUM

```sh
yum check-update
sudo yum -y install krb5-server
```

#### APK

```sh
sudo apk update
sudo apk add krb5-server
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y krb5-server
```
