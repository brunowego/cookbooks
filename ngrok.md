# ngrok

**Keywords:** Secure Tunnels, Tunneling

## Links

- [Main Website](https://ngrok.com)
- [Dashboard](https://dashboard.ngrok.com)

## CLI

### Dependencies

- [OpenSSH Server](/openssh/server.md)

### Installation

```sh
# Using APT
sudo apt update
sudo apt -y install wget unzip

# Using YUM
yum check-update
sudo yum -y install wget unzip
```

### Installation

```sh
# Using Homebrew
brew tap ngrok/ngrok
brew install ngrok

# Using Linux
( cd /usr/local/bin && \
  sudo wget -O tmp.zip 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip' && \
    sudo unzip tmp.zip && sudo rm tmp.zip )
```

### Configuration

Access [ngrok dashboard](https://dashboard.ngrok.com) and copy authtoken.

```sh
#
ngrok config add-authtoken <token>

#
cat ~/Library/Application\ Support/ngrok/ngrok.yml

#
ngrok diagnose
```

### Commands

```sh
ngrok -h
```

### Usage

```sh
# HTTP
ngrok http 80

# TCP
ngrok tcp 22

# Custom
ngrok http http://localhost:3000
# With domain
ngrok http http://localhost:3000 --domain <subdomain>.ngrok-free.app
```

### Tips

#### SSH Tunneling

```sh
ngrok tcp 22
```

```sh
ssh \
  -p <port> \
  <username>@<int>.tcp.ngrok.io
```
