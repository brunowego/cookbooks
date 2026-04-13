# GNU Wget

Its name derives from World Wide Web and get.

## CLI

### Installation

```sh
# Using Homebrew
brew install wget

# Using APT
sudo apt update
sudo apt -y install wget

# Using YUM
yum check-update
sudo yum -y install wget

# Using APK
sudo apk update
sudo apk add wget

# Using Chocolatey
choco install -y wget
```

### Commands

```sh
wget -h
```

### Tips

#### Binary Download

```sh
wget \
  -O - \
  '[download-link]' | \
    tar -xzC /usr/local/bin
```

#### Proxy

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
