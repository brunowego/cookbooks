# Linux

## Installation

### Zypper

```sh
sudo zypper update -y
sudo zypper install -y nodejs10
```

### YUM

```sh
curl -sL https://rpm.nodesource.com/setup_11.x | sudo -E bash -
sudo yum check-update
sudo yum -y install nodejs
```

### APT

```sh
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt update
sudo apt -y install nodejs
```

### Source

#### Dependencies

##### APT

```sh
sudo apt update
sudo apt -y install curl g++ make
```

#### Build & Install

```sh
curl https://nodejs.org/dist/v11.8.0/node-v11.8.0.tar.gz | tar -xz
( cd node-v11.8.0 && ./configure && make && sudo make install ) && rm -r node-v11.8.0
```
