# GCC, the GNU Compiler Collection (gcc)

## CLI

### Installation

#### Homebrew

```sh
# Darwin have gcc natively
gcc --version | head -1

#
brew install gcc
```

#### APT

```sh
sudo apt update
sudo apt -y install gcc libc6-dev
```

#### YUM

```sh
yum check-update

#
sudo yum -y install gcc-c++

# Repo: Software Collections
sudo yum -y install devtoolset-7-gcc-c++
scl enable devtoolset-7 "$SHELL"
sudo /usr/bin/sh -c 'echo "source scl_source enable devtoolset-7" >> /etc/profile.d/scl.sh'
```

#### APK

```sh
apk update
apk add gcc libc-dev
```

#### Source

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install wget make gcc-c++
```

##### Build & Install

```sh
wget -O - 'https://ftpmirror.gnu.org/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz' | tar -xJ

sed -i 's/ftp:/https:/' ./gcc-7.3.0/contrib/download_prerequisites

( cd ./gcc-7.3.0 && ./contrib/download_prerequisites && mkdir build && cd build && ../configure --enable-checking=release --enable-languages=c,c++ --disable-multilib && make -j 8 && sudo make install ) && rm -fR ./gcc-7.3.0
```

### Commands

```sh
gcc
```

### Usage

```sh
# Version
gcc --version | head -1
g++ --version | head -1
clang++ --version | head -1
```

### Tips

#### Search for Parameter

```sh
./configure --help | fgrep [param]
```
