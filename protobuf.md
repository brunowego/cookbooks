# Protocol Buffers

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

```sh
go get -u github.com/golang/protobuf/{proto,protoc-gen-go}
```
