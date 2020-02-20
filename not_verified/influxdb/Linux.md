# Linux

## Installation

### DPKG

```sh
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.7.1_amd64.deb
sudo dpkg -i influxdb_1.7.1_amd64.deb && rm -f influxdb_1.7.1_amd64.deb
```

### YUM

```sh
yum check-update
sudo yum -y install https://dl.influxdata.com/influxdb/releases/influxdb-1.7.1.x86_64.rpm
```

### Build

```sh
wget https://dl.influxdata.com/influxdb/releases/influxdb-1.7.1_linux_amd64.tar.gz
tar -xvfz influxdb-1.7.1_linux_amd64.tar.gz
```
