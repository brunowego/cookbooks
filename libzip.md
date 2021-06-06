# libzip

## Library

### Installation

#### Homebrew

```sh
brew install libzip
```

#### APT

```sh
sudo apt update
sudo apt -y install libzip-dev
```

#### YUM

```sh
sudo yum update
sudo yum -y install libzip-devel
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y libzip-devel
```

#### Source

##### Dependencies

###### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install cmake3
```

##### Build & Install

```sh
#
curl -L https://libzip.org/download/libzip-1.5.2.tar.gz | \
  tar -xz

#
( cd ./libzip-1.5.2 && mkdir ./build && cd "$_" && cmake3 ../ && make && sudo make install ) && rm -fR ./libzip-1.5.2
```
