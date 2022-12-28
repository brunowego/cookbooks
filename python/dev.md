# Python Development

## Library

### Installation

#### APT

```sh
# Python 3.x
sudo apt update
sudo apt install -y python3-dev
```

#### YUM

```sh
# Python 3.x
yum check-update
sudo yum install -y python3-devel
```

#### Zypper

```sh
# Python 2.x
sudo zypper refresh
sudo zypper install -y python-devel

# Python 3.x
sudo zypper refresh
sudo zypper install -y python3-devel
```

### Issues

#### Missing Header

```log
fatal error: pyconfig.h: No such file or directory
```

Just install Python Development library.
