# GNU Netcat

## CLI

### Installation

#### Homebrew

```sh
brew install netcat
```

#### APT

```sh
sudo apt update
sudo apt -y install netcat
```

### Commands

```sh
netcat -h
```

### Usage

```sh
#
nc -v [ip/dn] [port]
nc -v google.com 80

#
nc -l 9000

#
nmap -p 9000 localhost

#
curl \
  -X POST \
  -H 'Content-Type: application/json'
  -d '{"status": "ok"}' \
  127.0.0.1:9000

#
nc -4 -w3 -v google.com 80
```
