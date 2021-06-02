# minikube

## References

- [Tunnel](https://github.com/kubernetes/minikube/blob/master/docs/tunnel.md)

## CLI

### Installation

#### Homebrew

```sh
brew install minikube
```

#### Darwin

```sh
MINIKUBE_VERSION='1.20.0' \
  curl \
    -L "https://storage.googleapis.com/minikube/releases/v${MINIKUBE_VERSION}/minikube-darwin-amd64" \
    -o /usr/local/bin/minikube && \
      chmod +x /usr/local/bin/minikube

# Latest
curl \
  -L 'https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64' \
  -o /usr/local/bin/minikube && \
    chmod +x /usr/local/bin/minikube
```

#### Linux

```sh
MINIKUBE_VERSION='1.20.0' \
  sudo curl \
    -L "https://storage.googleapis.com/minikube/releases/v${MINIKUBE_VERSION}/minikube-linux-amd64" \
    -o /usr/local/bin/minikube && \
      sudo chmod +x /usr/local/bin/minikube

# Latest
sudo curl \
  -L 'https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64' \
  -o /usr/local/bin/minikube && \
    sudo chmod +x /usr/local/bin/minikube
```

#### Chocolatey

```sh
choco install -y minikube
```

### Configuration

```sh
minikube config view

# Disable Update Notification
minikube config set WantUpdateNotification false
# minikube config set addon-manager true
minikube config set cpus 2
minikube config set memory 4096
minikube config set disk-size 40g
```

#### VM Driver

- [Docker Machine Driver Hyperkit](/docker-machine-driver-hyperkit.md)
- [Docker Machine Driver Parallels](/docker-machine-driver-parallels.md)

```sh
# HyperKit (Darwin only)
minikube config set vm-driver 'hyperkit'

# VirtualBox
minikube config set vm-driver 'virtualbox'

# Parallels (Darwin only)
minikube config set vm-driver 'parallels'
```

### Commands

```sh
minikube --help
```

### Examples

#### Start

```sh
minikube start \
  $(echo "$MINIKUBE_START_OPTS") \
  -p minikube

# Custom Google Containers Repository
minikube start \
  $(echo "$MINIKUBE_START_OPTS") \
  -p minikube \
  --image-repository 'registry.cn-hangzhou.aliyuncs.com/google_containers' \
  --insecure-registry 'registry.cn-hangzhou.aliyuncs.com'

#
minikube start \
  $(echo "$MINIKUBE_START_OPTS") \
  --feature-gates=TTLAfterFinished=true
```

```sh
# Show Current
minikube profile

# Set
minikube profile minikube

#
kubectl config view

#
kubectl config set-context \
  --cluster=minikube \
  --user=minikube \
  minikube

#
minikube stop -p minikube
```

#### Addons

```sh
#
minikube addons list

# NGINX Ingress Controller
minikube addons enable ingress
minikube addons enable ingress-dns
```

#### Mount

```sh
minikube mount [/path/to/export]:[/path/to/mount/point]
```

### Environment

```sh
#
eval "$(minikube docker-env)"
```

### Tips

#### Proxy

```sh
jq ".HostOptions.EngineOptions.Env += [ \"http_proxy=$http_proxy\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
jq ".HostOptions.EngineOptions.Env += [ \"https_proxy=$https_proxy\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
jq ".HostOptions.EngineOptions.Env += [ \"no_proxy=$no_proxy\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
```

```sh
minikube stop && \
  minikube start
```

```sh
docker info | grep Proxy
```

#### CIDR Route

```sh
# Adding
sudo route \
  -n add \
  -net "$(cat ~/.minikube/profiles/minikube/config.json | \
    jq -r '.KubernetesConfig.ServiceCIDR')" "$(minikube ip)"

# Removing
sudo route \
  -n delete \
  -net "$(cat ~/.minikube/profiles/minikube/config.json | \
    jq -r '.KubernetesConfig.ServiceCIDR')" "$(minikube ip)"
```

### Issues

<!-- ####

```log
Unable to start VM. Please investigate and run 'minikube delete' if possible: creating host: create: precreate: Parallels Desktop edition could not be fetched!
``` -->

#### DHCP Client Lease DB

```sh
cat /var/db/dhcpd_leases
```

```sh
sudo rm -f /var/db/dhcpd_leases
```

#### Route Conflict

```log
E0729 13:29:35.162550   91854 tunnel.go:50] error cleaning up: conflicting rule in routing table: 10.96/12           192.168.64.16      UGSc            0        0 bridge1
```

```sh
route -n get 10.96/12
```

```sh
sudo route delete -net 10.96/12
```

```sh
minikube tunnel -c
```

#### Locked VirtualBox VM

```sh
ps -ef | grep -i VBoxHeadless
```

```sh
kill -9 [PID]
```

### Uninstall

```sh
sudo rm -fR /usr/local/bin/minikube
```

```sh
rm -fR ~/.minikube
```
