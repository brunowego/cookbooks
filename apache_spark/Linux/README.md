# Linux

## Dependencies

### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-8-jre
```

### YUM

```sh
sudo yum check-update
sudo yum -y install curl java-1.8.0-openjdk-devel
```

## Installation

```sh
curl https://archive.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz | sudo tar -xzC /opt
sudo ln -s /opt/spark-2.4.0-bin-hadoop2.7 /opt/spark
```
