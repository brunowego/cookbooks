# ngrok

## CLI

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install wget unzip
```

#### YUM

```sh
sudo yum check-update
sudo yum -y install wget unzip
```

### Installation

#### Homebrew

```sh
brew cask install ngrok
```

#### Linux

```sh
( cd /usr/local/bin && wget -O tmp.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && unzip tmp.zip && rm tmp.zip )
```

### Commands

```sh
ngrok -h
```

#### Authtoken

Access [ngrok dashboard](https://dashboard.ngrok.com) and copy authtoken.

```sh
ngrok authtoken [token]
```

### Examples

#### SSH Tunneling

```sh
ngrok tcp 22
```

```sh
ssh [username]@0.tcp.ngrok.io -p [port]
```
