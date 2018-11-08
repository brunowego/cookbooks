# Linux

## Installation

### YUM

#### EPEL

```sh
sudo yum check-update
sudo yum -y install epel-release
sudo yum -y install python34
```

#### SCL

```sh
sudo yum check-update
sudo yum -y install centos-release-scl
sudo yum -y install rh-python36
```

```sh
scl enable rh-python36 $SHELL
```

```sh
sudo sh -c 'echo "source scl_source enable rh-python36" >> /etc/profile.d/scl.sh'
```

### APT

```sh
sudo apt update
sudo apt -y install python3
```

### APK

```sh
sudo apk update
sudo apk add python3
```

### Source

#### Dependencies

##### YUM

```sh
sudo yum check-update
sudo yum -y install curl gcc-c++ make zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

##### APT

```sh
sudo apt update
sudo apt -y install curl g++ make zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev
```

#### Build & Install

```sh
curl https://www.python.org/ftp/python/3.7.1/Python-3.7.1.tgz | tar -zx
( cd Python-3.7.1 && ./configure --prefix /usr/local/lib/python3 --with-threads --enable-shared && make && sudo make altinstall ) && rm -r Python-3.7.1
```

```sh
sudo sh -c 'echo "/usr/local/lib/python3" >> /etc/ld.so.conf.d/python3.conf'
```

```sh
sudo ldconfig
```
