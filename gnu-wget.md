# GNU Wget

Its name derives from World Wide Web and get.

## CLI

### Installation

#### Homebrew

```sh
brew install wget
```

#### APT

```sh
sudo apt update
sudo apt -y install wget
```

#### YUM

```sh
yum check-update
sudo yum -y install wget
```

#### APK

```sh
sudo apk update
sudo apk add wget
```

#### Chocolatey

```sh
choco install -y wget
```

### Commands

```sh
wget -h
```

### Proxy

```sh
tee -a ~/.wgetrc << EOF
HTTP_PROXY=$http_proxy
HTTPS_PROXY=$https_proxy
NO_PROXY=$no_proxy
http_proxy=$http_proxy
https_proxy=$https_proxy
no_proxy=$no_proxy
EOF
```
