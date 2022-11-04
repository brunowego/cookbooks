# GNU Netcat

## Kubernetes

### Running

```sh
#
kubectl create ns testing

#
kubens testing

#
kubectl run --rm -it \
  nc \
  --image docker.io/brunowego/netcat:latest \
  -l 'app=nc' \
  --command \
  -- /bin/sh -c 'tail -f /dev/null'

#
kubectl exec -it nc -- /bin/sh

#
nc -zv <hostname> <port>
```

<!-- ```sh
#
kubectl run -it \
  netcat \
  --image docker.io/brunowego/netcat:latest \
  --command /bin/sh

#
kubectl attach -it netcat \
  -c netcat
``` -->

### Delete

```sh
kubectl delete pod netcat
```

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

#### APK

```sh
apk update
apk add netcat
```

#### Chocolatey

```sh
choco install -y netcat
```

### Commands

```sh
netcat -h
```

### Usage

```sh
#
nc -v <host> <port>
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

<!--
nc -lnvp <port>
-->
