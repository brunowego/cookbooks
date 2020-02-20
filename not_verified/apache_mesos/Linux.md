# Linux

## Dependencies

### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-7-jre
```

### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk
```

## Installation

```sh
curl https://archive.apache.org/dist/mesos/1.7.0/mesos-1.7.0.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/mesos-1.7.0 /opt/mesos
```
