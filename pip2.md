# Python Package Index (PIP2)

## CLI

### Installation

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install python2-pip
```

#### APT

```sh
sudo apt update
sudo apt -y install python-pip
```

#### APK

```sh
sudo apk update
sudo apk add py2-pip
```

### Commands

```sh
pip2 -h
```

### Issues

#### Permission denied

```sh
copying build/lib/[filename].py -> /usr/lib/python2.7/site-packages
error: /usr/lib/python2.7/site-packages/[filename].py: Permission denied
```

```sh
#
pip install -U [package]
```
