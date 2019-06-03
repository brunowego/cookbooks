# minikube

## Installation

## OS X

```sh
curl -L https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 -o /usr/local/bin/minikube
```

```sh
chmod +x /usr/local/bin/minikube
```

### Linux

```sh
sudo curl -L https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 -o /usr/local/bin/minikube
```

```sh
sudo chmod +x /usr/local/bin/minikube
```

### Chocolatey

```sh
choco install -y minikube
```

## Commands

```sh
minikube --help
```

### Start

#### Oracle VirtualBox

```sh
minikube start \
  --cpus 4 \
  --disk-size 40g \
  --host-only-cidr '10.100.1.1/24' \
  --memory 8192 \
  --vm-driver virtualbox
```

## Configuration

### Network

#### Proxy

```sh
jq ".HostOptions.EngineOptions.Env[0] |= \"http_proxy=$http_proxy\"" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
jq ".HostOptions.EngineOptions.Env[1] |= \"https_proxy=$https_proxy\"" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
jq ".HostOptions.EngineOptions.Env[2] |= \"no_proxy=$no_proxy\"" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
```

```sh
minikube stop
minikube start
```

```sh
minikube ssh docker info | grep Proxy
```

## Issues

### Locked VM

```sh
ps -ef | grep -i VBoxHeadless
```

```sh
kill -9 [PID]
```
