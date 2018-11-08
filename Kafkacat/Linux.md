# Linux

## Dependencies

### Zypper

```sh
sudo zypper install -y git-core gcc-c++ which make wget
```

### APT

```sh
sudo apt update
sudo apt -y install build-essential git which make wget zlib1g-dev
```

### YUM

```sh
sudo yum check-update
sudo yum -y install git which make wget gcc-c++ zlib-devel
```

### APK

```sh
sudo apk update
sudo apk add git bash make wget g++ zlib-dev
```

## Installation

```sh
git clone --branch 1.3.1 --single-branch --depth 1 https://github.com/edenhill/kafkacat.git
( cd kafkacat && ./bootstrap.sh )
```

```sh
( cd kafkacat && sudo mv ./kafkacat /usr/local/bin ) && rm -fR kafkacat
```
