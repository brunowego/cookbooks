# Linux

## Installation

```sh
curl https://archive.apache.org/dist/avro/avro-1.8.2/avro-src-1.8.2.tar.gz | tar -xzC /tmp
```

### C

```sh
sudo yum check-update
sudo yum -y install curl cmake jansson-devel zlib-devel snappy-devel xz-devel asciidoc
```

```sh
( cd /tmp/avro-src-1.8.2/lang/c && mkdir -p build && cd build && cmake -G 'Unix Makefiles' -D CMAKE_BUILD_TYPE=Release .. && sudo make install ) && rm -fR /tmp/avro-src-1.8.2
```

### C++

```sh
sudo yum check-update
sudo yum -y install curl cmake boost-devel
```

```sh
( cd /tmp/avro-src-1.8.2/lang/c++ && mkdir -p build && cd build && cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release .. && sudo make install ) && rm -fR /tmp/avro-src-1.8.2
```
