# Linux

## Dependencies

### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk-devel
```

## Installation

```sh
curl -L https://github.com/OpenTSDB/opentsdb/archive/v2.4.0.tar.gz | sudo tar -xzC /opt
( cd /opt/opentsdb-2.4.0 && sudo ./build.sh )
sudo ln -s /opt/opentsdb-2.4.0 /opt/opentsdb
```
