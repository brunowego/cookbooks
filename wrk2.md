# wrk2

## CLI

### Dependencies

#### YUM

```sh
yum check-update
sudo yum -y install wget make gcc openssl-devel
```

### Installation

#### Unix-like

```sh
wget -O - https://github.com/giltene/wrk2/archive/master.tar.gz | tar -xz
( cd ./wrk2-master && make && sudo mv wrk /usr/local/bin ) && rm -fR ./wrk2-master
```
