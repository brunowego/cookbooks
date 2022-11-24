# Network Mapper (Nmap)

<!--
https://app.pluralsight.com/paths/skills/information-security-testing-and-auditing-with-nmap
-->

<!--
Zenmap

Xmas scan
-->

**Keywords:** Information Gathering

## References

- [Nmap Reference Guide](https://nmap.org/book/man.html)

## Glossary

- SYN-ACK (SA)

## Terms

- Stealth Scan (TCP SYN (Stealth) Scan (-sS))
- Three‐way Handshake (SYN, SYN-ACK, ACK handshake)

<!--
Spoofing
-->

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nmap \
  --name nmap \
  docker.io/uzyexe/nmap:7.60 -h
```

## Kubernetes

### Running

```sh
#
kubectl create ns testing

#
kubens testing

#
kubectl run --rm -it \
  nmap \
  --image docker.io/uzyexe/nmap:7.60 \
  -l 'app=nmap' \
  --command \
  -- /bin/sh -c 'tail -f /dev/null'

#
kubectl exec -it nmap -- /bin/sh
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

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y nmap
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

**Tips:** Prefer use [GNU Netcat](/gnu-netcat.md) to test ports.

```sh
# Operation system
sudo nmap -O 127.0.0.1

# Host status
sudo nmap -PN 127.0.0.1

# Range host status
sudo nmap -PN xxx.xxx.xxx.xxx-yyy

# TCP Port Scan
nmap -p 80 127.0.0.1 # specific
nmap -p 1-200 192.168.0.1 # range
nmap -F 127.0.0.1 # common ports
nmap -p - 127.0.0.1 # all

# Available services
sudo nmap -sP network_address_range

#
nmap -p 3128 127.0.0.1

nmap \
  -p 80,443 \
  --proxy http://127.0.0.1:3128 \
  [hostname]
```

<!--
https://www.digitalocean.com/community/tutorials/how-to-use-nmap-to-scan-for-open-ports-on-your-vps
https://phoenixnap.com/kb/nmap-scan-open-ports
-->
