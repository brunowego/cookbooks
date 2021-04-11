# Apache Portable Runtime

## CLI

### Installation

#### Source

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install wget gcc make expat-devel
```

##### Build & Install

```sh
wget -O - https://archive.apache.org/dist/apr/apr-1.7.0.tar.gz | tar -xz
( cd ./apr-1.7.0 && ./configure && make && sudo make install ) && rm -fR ./apr-1.7.0
```

```sh
wget -O - https://archive.apache.org/dist/apr/apr-util-1.6.1.tar.gz | tar -xz
( cd ./apr-util-1.6.1 && ./configure --with-apr=/usr/local/apr && make && sudo make install ) && rm -fR ./apr-util-1.6.1
```
