# MicroK8s

## CLI

### References

- [Working with image registries](https://microk8s.io/docs/working)

### Dependencies

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install ufw
```

### Installation

#### Snappy

```sh
sudo snap install microk8s --channel=edge --classic
```

### Configuration

#### Kubectl

```sh
microk8s.kubectl --help
```

```sh
sudo snap alias microk8s.kubectl kubectl
```

```sh
# hidden from nautilus
echo snap >> ~/.hidden
```

#### Enable

```sh
microk8s.enable storage dns
```

#### Registry

https://stackoverflow.com/questions/56515971/microk8s-pulling-image-stuck-in-containercreating-state

```sh
microk8s.enable registry

docker tag backend localhost:32000/backend
docker push localhost:32000/backend
```

#### Dashboard

```sh
microk8s.enable dashboard

kubectl patch service kubernetes-dashboard -p '{"spec":{"type":"LoadBalancer"}}' -n kube-system
```

### Commands

#### Show Configuration

```sh
microk8s.config; echo
```

```sh
kubectl config view --raw > "$HOME/.kube/config"
```

#### Inspect

```sh
microk8s.inspect
```

#### Status

```sh
microk8s.status
```

#### Enable/Disable

```sh
microk8s.enable
microk8s.disable

# enable istio
microk8s.enable istio
microk8s.istioctl --help

# enable linkerd
microk8s.enable linkerd
microk8s.linkerd
```

#### containerd CLI

```sh
microk8s.ctr -h

# namespaces
microk8s.ctr namespaces -h

# containers
microk8s.ctr -n k8s.io containers -h

# images
microk8s.ctr -n k8s.io images -h
```

#### Start/Stop

```sh
microk8s.start
microk8s.stop
```

#### Reset

```sh
microk8s.reset
```

### Logs

#### Status

```sh
sudo systemctl status snap.microk8s.daemon-controller-manager
sudo systemctl status snap.microk8s.daemon-scheduler
sudo systemctl status snap.microk8s.daemon-apiserver-kicker
sudo systemctl status snap.microk8s.daemon-etcd
sudo systemctl status snap.microk8s.daemon-apiserver
sudo systemctl status snap.microk8s.daemon-kubelet
sudo systemctl status snap.microk8s.daemon-containerd
sudo systemctl status snap.microk8s.daemon-proxy
```

#### Logs

```sh
sudo journalctl -u snap.microk8s.daemon-controller-manager
sudo journalctl -u snap.microk8s.daemon-scheduler
sudo journalctl -u snap.microk8s.daemon-apiserver-kicker
sudo journalctl -u snap.microk8s.daemon-etcd
sudo journalctl -u snap.microk8s.daemon-apiserver
sudo journalctl -u snap.microk8s.daemon-kubelet
sudo journalctl -u snap.microk8s.daemon-containerd
sudo journalctl -u snap.microk8s.daemon-proxy
```

### Tips

#### Proxy

```sh
sudo /usr/bin/sh -c 'echo "\nHTTPS_PROXY=$https_proxy" >> /var/snap/microk8s/current/args/containerd-env'
```

```sh
sudo systemctl restart snap.microk8s.daemon-containerd
```

#### Using reg

```sh
# list
reg ls -f 127.0.0.1:32000

# remove
reg rm -f 127.0.0.1:32000/[image]
```
