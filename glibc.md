# GNU C Library (glibc)

## Installation

### Zypper

```sh
sudo zypper refresh
sudo zypper install -y glibc
```

### Source

#### Dependencies

##### YUM

```sh
yum check-update
sudo yum -y install wget gcc-c++ make bison
```

#### Build & Install

```sh
wget -O - 'https://ftpmirror.gnu.org/gnu/glibc/glibc-2.23.tar.gz' | tar -xz
( cd ./glibc-2.23 && mkdir build && cd build && ../configure --prefix=/usr && make -j 4 && sudo make install ) && rm -fR ./glibc-2.23
```

```sh
sudo unlink /usr/lib64/libm.so.6
sudo ln -s /usr/lib64/libm-2.23.so /usr/lib64/libm.so.6
```
