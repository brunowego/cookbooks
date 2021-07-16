# Protocol Buffers (a.k.a Protobuf)

<!--
https://linkedin.com/learning/building-java-microservices-with-grpc/microservices-with-grpc
https://github.com/envoyproxy/protoc-gen-validate
-->

## CLI

### Installation

#### Homebrew

```sh
brew install protobuf
```

#### APT

```sh
sudo apt update
sudo apt -y install protobuf-compiler
```

#### YUM

```sh
yum check-update
sudo yum -y install protobuf-compiler
```

#### APK

```sh
sudo apk update
sudo apk add protobuf
```

### Tips

#### Visual Studio Code

```sh
code \
  --install-extension zxh404.vscode-proto3 \
  --install-extension ripwu.protobuf-helper \
  --install-extension plex.vscode-protolint
```

## Protocol Compiler

### Installation

#### go get

```sh
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
```
