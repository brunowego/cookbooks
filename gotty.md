# GoTTY

## CLI

### Installation

#### Homebrew

```sh
brew install sorenisanerd/gotty/gotty
```

#### go get

```sh
go get github.com/sorenisanerd/gotty
```

#### Linux Binary

```sh
curl \
  -L https://github.com/sorenisanerd/gotty/releases/download/v1.2.0/gotty_v1.2.0_linux_amd64.tar.gz | \
    sudo tar -xzC /usr/local/bin
```

### Configuration

```sh
cat << EOF > ~/.gotty
port = "8080"

EOF
```

### Commands

```sh
gotty -h
```

### Usage

```sh
# Command
gotty [command]

# Examples
gotty top
gotty -w \
  docker run -it --rm docker.io/library/busybox:latest
```
