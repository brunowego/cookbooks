# Linux

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install gcc-c++ zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install python2
```

> Preferably to install through [SCL](https://www.softwarecollections.org)

### APT

```sh
sudo apt update
sudo apt -y install python2.7
```

### Building

```sh
curl https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz | tar -zx
( cd Python-2.7.15 && ./configure --prefix /usr/local/lib/python2 --with-threads --enable-shared && make && sudo make altinstall ) && rm -r Python-2.7.15
```

```sh
sudo sh -c 'echo "/usr/local/lib/python2" >> /etc/ld.so.conf.d/python2.conf'
```

```sh
sudo ldconfig
```
