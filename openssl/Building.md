# Building

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install zlib-devel
```

### APT

```sh
sudo apt update
sudo apt -y install zlib1g-dev
```

## Installation

```sh
curl https://www.openssl.org/source/openssl-1.1.1.tar.gz | tar -xz
( cd openssl-1.1.1 && ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib && make && sudo make install ) && rm -r openssl-1.1.1
```

## Reload Dynamic Link

```sh
sudo sh -c 'echo "/usr/local/ssl/lib" > /etc/ld.so.conf.d/openssl-1.1.1.conf'
sudo ldconfig -v
```

## Binaries

### Backup Current

```sh
sudo mv /usr/bin/c_rehash /usr/bin/c_rehash.bkp
sudo mv /usr/bin/openssl /usr/bin/openssl.bkp
```

## Shell

### Bash

```sh
echo -e '\n# OpenSSL\nexport PATH="/usr/local/ssl/bin:$PATH"' >> ~/.bashrc
```

```sh
source ~/.bashrc
```
