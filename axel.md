# Linux

## CLI

### Installation

#### Homebrew

```sh
brew install axel
```

#### APT

```sh
sudo apt update
sudo apt -y install axel
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install axel
```

#### Source

##### Dependencies

###### APT

```sh
sudo apt update
sudo apt -y install wget pkg-config libssl-dev
```

##### Build & Install

```sh
wget -O - https://github.com/axel-download-accelerator/axel/releases/download/v2.16.1/axel-2.16.1.tar.gz | tar -xz
( cd ./axel-2.16.1 && ./configure && make && sudo make install ) && rm -r ./axel-2.16.1
```

#### Chocolatey

```sh
choco install -y axel
```

### Commands

```sh
axel --help
```

### Proxy

```sh
tee -a ~/.axelrc << EOF
http_proxy=$http_proxy
https_proxy=$https_proxy
no_proxy=$no_proxy
EOF
```
