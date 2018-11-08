# Linux

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install libatomic
```

## Installation

```sh
curl -LO https://github.com/google/protobuf/releases/download/v3.7.0/protoc-3.7.0-linux-x86_64.zip
sudo unzip protoc-3.7.0-linux-x86_64.zip -d /usr/local bin/protoc include/google/* && rm protoc-3.7.0-linux-x86_64.zip
```
