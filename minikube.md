# minikube

## Alternatives

- [Kubernetes in Docker (KinD)](/kind/README.md)

## Links

- [Code Repository](https://github.com/kubernetes/minikube)
- [Main Website](https://minikube.sigs.k8s.io/)

## References

- [Tunnel](https://github.com/kubernetes/minikube/blob/master/docs/tunnel.md)

## CLI

### Dependencies

- VM Driver
  - [HyperKit](/hyperkit.md)
  - [Oracle VM VirtualBox](/virtualbox.md)
  - [Parallels](/parallels.md)

### Installation

#### Homebrew

```sh
brew install minikube
```

#### Darwin Binary

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

#### Linux Binary

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
#
minikube config list

#
minikube config set WantUpdateNotification false
minikube config set cpus 2
minikube config set memory 4096
minikube config set disk-size 40g

#
minikube config view
```

<!--
minikube config set addon-manager true
-->

#### VM Driver

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

### Usage

```sh
# Using default
minikube start \
  $(echo "$MINIKUBE_START_OPTS") \
  -p minikube-default

# Using specific Kubernetes version. Kubernetes Releases: https://kubernetes.io/releases/
export KUBERNETES_VERSION='1.24.3'

minikube start \
  $(echo "$MINIKUBE_START_OPTS") \
  -p minikube-default \
  --bootstrapper kubeadm \
  --kubernetes-version "$KUBERNETES_VERSION"

# Using feature gates
minikube start \
  $(echo "$MINIKUBE_START_OPTS") \
  -p minikube-default \
  --feature-gates=TTLAfterFinished=true

# Using custom Google Containers Repository
minikube start \
  $(echo "$MINIKUBE_START_OPTS") \
  -p minikube-default \
  --image-repository 'registry.cn-hangzhou.aliyuncs.com/google_containers' \
  --insecure-registry 'registry.cn-hangzhou.aliyuncs.com'

#
minikube profile minikube-default

#
minikube status -p minikube-default
```

```sh
# Show Current
minikube profile list

#
kubectl config view

#
kubectl config set-context \
  --cluster minikube-default \
  --user minikube-default \
  minikube-default

#
minikube ssh sudo ip link set docker0 promisc on
```

#### Addons

```sh
#
minikube addons list
```

##### NGINX Ingress Controller

1. [Using Helm](/kubernetes/ingress-controllers/ingress-nginx/README.md#helm)
2. [Using Build-in](/kubernetes/ingress-controllers/ingress-nginx/README.md#minikube)

##### MetricServer

1. [Using Helm](/metrics-server.md#helm)
2. [Using Build-in](/metrics-server.md#minikube)

#### Mount

```sh
minikube mount [/path/to/export]:[/path/to/mount/point]
```

### Environment

```sh
#
eval "$(minikube docker-env)"
```

#### Delete

```sh
#
minikube stop -p minikube-default

#
minikube delete -p minikube-default
```

### Tips

#### Proxy

```sh
jq ".HostOptions.EngineOptions.Env += [ \"http_proxy=$http_proxy\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
jq ".HostOptions.EngineOptions.Env += [ \"https_proxy=$https_proxy\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
jq ".HostOptions.EngineOptions.Env += [ \"no_proxy=$no_proxy\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
```

```sh
minikube stop -p minikube-default && \
  minikube start -p minikube-default
```

```sh
docker info | grep Proxy
```

#### CIDR Route

```sh
#
export INGRESS_HOST="$(minikube ip)"

# Adding
sudo route \
  -n add \
  -net "$(cat ~/.minikube/profiles/minikube/config.json | \
    jq -r '.KubernetesConfig.ServiceCIDR')" "$INGRESS_HOST"

# Removing
sudo route \
  -n delete \
  -net "$(cat ~/.minikube/profiles/minikube/config.json | \
    jq -r '.KubernetesConfig.ServiceCIDR')" "$INGRESS_HOST"
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
