# ngrok

**Keywords**: Secure tunnels

## CLI

### Dependencies

- [OpenSSH Server](/openssh-server.md)

#### APT

```sh
sudo apt update
sudo apt -y install wget unzip
```

#### YUM

```sh
yum check-update
sudo yum -y install wget unzip
```

### Installation

#### Homebrew

```sh
brew cask install ngrok
```

#### Linux

```sh
( cd /usr/local/bin && sudo wget -O tmp.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && sudo unzip tmp.zip && sudo rm tmp.zip )
```

### Commands

```sh
ngrok -h
```

### Configuration

#### Authtoken

Access [ngrok dashboard](https://dashboard.ngrok.com) and copy authtoken.

```sh
ngrok authtoken [token]
```

### Tips

#### SSH Tunneling

```sh
ngrok tcp 22
```

```sh
ssh \
  -p [port] \
  [username]@[int].tcp.ngrok.io
```
