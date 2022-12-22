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

### Usage

TODO

<!-- ### Tips

#### TBD

```sh
protoc \
  -I=. \
  -I=.. \
  --go_out . \
  --go_opt paths=source_relative \
  --go-grpc_out . \
  --go-grpc_opt paths=source_relative \
  --doc_out=. \
  --doc_opt=html,protobuf.html \
  --grpc-gateway_out . \
  --grpc-gateway_opt logtostderr=true \
  --grpc-gateway_opt paths=source_relative \
  --grpc-gateway_opt generate_unbound_methods=true \
  proto/*.proto
``` -->

#### Visual Studio Code

```sh
code \
  --install-extension zxh404.vscode-proto3 \
  --install-extension ripwu.protobuf-helper
```

## Protocol Compiler

### Installation

#### go get

```sh
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
```
