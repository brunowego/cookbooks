# TCPflow

## CLI

### Application

#### Homebrew

```sh
brew install tcpflow
```

#### APT

```sh
sudo apt -y install tcpflow
```

### Commands

```sh
tcpflow -h
```

### Usage

```sh
tcpflow -p -c port 80

tcpflow -p -c -i eth0 port 80 | grep -oE '(GET|POST|HEAD) .* HTTP/1.[01]|Host: .*'
```
