# libzip

## Installation

### Source

#### Dependencies

##### YUM

```sh

# Repo: EPEL
sudo yum -y install cmake3
```

##### Build & Install

```sh
curl -L https://libzip.org/download/libzip-1.5.2.tar.gz | tar -xz
( cd ./libzip-1.5.2 && mkdir ./build && cd "$_" && cmake3 ../ && make && sudo make install ) && rm -fR ./libzip-1.5.2
```
