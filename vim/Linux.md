# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install vim
```

### APT

```sh
sudo apt update
sudo apt -y install vim
```

### APK

```sh
sudo apk update
sudo apk add vim
```

### Source

#### Dependencies

```sh
sudo yum check-update
sudo yum -y install curl ncurses-devel make
```

#### Build & Install

```sh
curl -L https://github.com/vim/vim/archive/v8.1.0968.tar.gz | tar -xz
```

```sh
( cd vim-8.1.0968 && ./configure \
  --enable-cscope \
  --enable-multibyte \
  --disable-gui \
  --disable-nls \
  --with-tlib=ncurses \
  --with-features=huge \
  --without-x )
```

```sh
( cd vim-8.1.0968 && make && sudo make install ) && rm -r vim-8.1.0968
```
