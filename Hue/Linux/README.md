# Linux

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install python-devel maven libffi-devel openssl-devel openldap-devel mysql-devel sqlite-devel libxml2-devel libxslt-devel gmp-devel
```

## Installation

```sh
curl -L https://github.com/cloudera/hue/archive/release-4.2.0.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/hue-release-4.2.0 /opt/hue
( cd /opt/hue && sudo make install && sudo /opt/hue/build/env/bin/pip install logilab-astng && sudo make apps )
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin hue
```

```sh
sudo usermod -aG hue $USER && sudo su - $USER
```
