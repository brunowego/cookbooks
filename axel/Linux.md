# Linux

## Installation

### APT

```sh
sudo apt update
sudo apt -y install axel
```

### YUM

```sh
sudo yum check-update
sudo yum -y install epel-release
sudo yum -y install axel
```

### Source

#### Dependencies

##### APT

```sh
sudo apt update
sudo apt -y install wget pkg-config libssl-dev
```

#### Build & Install

```sh
wget -O - https://github.com/axel-download-accelerator/axel/releases/download/v2.16.1/axel-2.16.1.tar.gz | tar -xz
( cd axel-2.16.1 && ./configure && make && sudo make install ) && rm -r axel-2.16.1
```
