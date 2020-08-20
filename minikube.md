# minikube

## References

- [Tunnel](https://github.com/kubernetes/minikube/blob/master/docs/tunnel.md)

## CLI

### Installation

#### Darwin

```sh
# v1.6.0
curl \
  -L 'https://storage.googleapis.com/minikube/releases/v1.4.0/minikube-darwin-amd64' \
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
# v1.4.0
sudo curl \
  -L 'https://storage.googleapis.com/minikube/releases/v1.4.0/minikube-linux-amd64' \
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
```

#### Base

```sh
mkdir -p ~/.minikube/config
```

```sh
tee ~/.minikube/config/config.json << EOF
{
  "addon-manager": true,
  "cpus": 4,
  "disk-size": "40g",
  "memory": 8192
}
EOF
```

#### VM Driver

- [Docker Machine Driver Hyperkit](/docker-machine-driver-hyperkit.md)

```sh
# HyperKit (Darwin only)
minikube config set vm-driver 'hyperkit'
```

```sh
# VirtualBox
minikube config set vm-driver 'virtualbox'
```

- [Docker Machine Driver Parallels](/docker-machine-driver-parallels.md)

```sh
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
```

```sh
#
minikube profile
minikube profile minikube
```

```sh
#
kubectl config view

kubectl config set-context \
  --cluster=minikube \
  --user=minikube \
  minikube
```

#### Addons

```sh
# NGINX Ingress Controller
minikube addons enable ingress
```

#### Mount

```sh
minikube mount [/path/to/export]:[/path/to/mount/point]
```

### Environment

```sh
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
