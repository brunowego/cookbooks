# OpenSSH Client

## CLI

### Installation

#### Homebrew

```sh
brew install openssh
```

#### YUM

```sh
yum check-update
sudo yum -y install openssh-clients
```

#### APT

```sh
sudo apt update
sudo apt -y install openssh-client
```

#### APK

```sh
sudo apk update
sudo apk add openssh-client
```

#### PowerShell

```sh
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
```

### Commands

```sh
sshd --help
ssh-keygen --help
```

### Configuration

#### PowerShell

```sh
# Start Daemon
Start-Service sshd

#
Set-Service \
  -Name sshd \
  -StartupType 'Automatic'

#
Get-NetFirewallRule -Name *ssh*

#
New-NetFirewallRule \
  -Name sshd \
  -DisplayName 'OpenSSH Server (sshd)' \
  -Enabled True \
  -Direction Inbound \
  -Protocol TCP \
  -Action Allow \
  -LocalPort 22
```

### Issues

#### Library LDNS

```log
dyld: Library not loaded: /usr/local/opt/ldns/lib/libldns.3.dylib
```

```sh
brew reinstall ldns
```

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t openssh-client -
FROM docker.io/alpine:3.9

RUN apk add -q --no-cache openssh-client

ENTRYPOINT ["/usr/bin/ssh"]
EOF
```

### Running

```sh
docker run -it --rm \
  --name openssh-client \
  docker.io/library/openssh-client:latest $(whoami)@$(ip route get 1 | awk '{print $NF;exit}')
```
