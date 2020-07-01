# Nmap

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nmap \
  --name nmap \
  docker.io/uzyexe/nmap:7.60 -h
```

## CLI

### Installation

#### Homebrew

```sh
brew install nmap
```

#### APT

```sh
sudo apt update
sudo apt -y install nmap
```

#### YUM

```sh
yum check-update
sudo yum -y install nmap
```

#### Chocolatey

```sh
choco install -y nmap
```

### Commands

```sh
ncat -h
man ndiff
nmap -h
nping -h
```

### Usage

```sh
# Operation system
sudo nmap -O 127.0.0.1

# Host status
sudo nmap -PN 127.0.0.1

# Range host status
sudo nmap -PN xxx.xxx.xxx.xxx-yyy

# Scan port
nmap -p 80 127.0.0.1 # specific
nmap -p 1-200 192.168.0.1 # range
nmap -F 127.0.0.1 # common ports
nmap -p - 127.0.0.1 # all

# Available services
sudo nmap -sP network_address_range
```

<!--
https://www.digitalocean.com/community/tutorials/how-to-use-nmap-to-scan-for-open-ports-on-your-vps
https://phoenixnap.com/kb/nmap-scan-open-ports
-->
