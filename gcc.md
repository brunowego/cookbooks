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
sudo yum -y install gcc
```

#### APK

```sh
apk update
apk add gcc libc-dev
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y gcc
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
```

### Tips

#### Search for Parameter

```sh
./configure --help | fgrep [param]
```

### Issues

#### Missing Command

```log
unable to execute 'gcc': No such file or directory
error: command 'gcc' failed with exit status 1
```

Just install GCC, the GNU Compiler Collection (gcc).
