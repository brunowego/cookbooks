# GoTTY

**Keywords:** Terminal output

## CLI

### Installation

#### Homebrew

```sh
brew tap sorenisanerd/gotty
brew install gotty
```

#### go get

```sh
go get github.com/sorenisanerd/gotty
```

#### Linux Binary

```sh
curl \
  -L 'https://github.com/sorenisanerd/gotty/releases/download/v1.2.0/gotty_v1.2.0_linux_amd64.tar.gz' | \
    sudo tar -xzC /usr/local/bin
```

### Configuration

```sh
cat << EOF > ~/.gotty
port = "9000"

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
```

#### Screen

```sh
gotty \
  -c 'admin:admin' \
    screen \
    -x [session_id]

ngrok http 9000
```

#### Docker

```sh
gotty -w \
  docker run -it --rm \
    docker.io/library/busybox:latest
```
