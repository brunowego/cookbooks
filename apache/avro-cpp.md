# Apache Avro C++ (a.k.a. avro-cpp)

## CLI

### Installation

#### Homebrew

```sh
brew install avro-cpp
```

#### Source Code

##### Dependencies

###### YUM

```sh
yum check-update
sudo yum -y install curl cmake boost-devel
```

##### Build & Install

```sh
curl 'https://archive.apache.org/dist/avro/avro-1.8.2/avro-src-1.8.2.tar.gz' | \
  tar -xzC /tmp
```

```sh
( cd /tmp/avro-src-1.8.2/lang/c++ && mkdir -p build && cd build && cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release .. && sudo make install ) && \
  rm -fR /tmp/avro-src-1.8.2
```

### Commands

```sh
avrogencpp
```
