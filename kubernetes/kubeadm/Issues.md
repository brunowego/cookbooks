# Issues

## Could not fetch a Kubernetes version from the internet

> Get https://dl.k8s.io/release/stable-1.txt: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)

Set HTTP proxy environment.

## Connection uses proxy

> If that is not intended, adjust your proxy settings

```sh
export no_proxy="$no_proxy,$(ip route get 1 | awk '{print $NF;exit}')"
export NO_PROXY=$no_proxy
```

> Persist this configuration on `/etc/profile.d/no-proxy.sh`.

```sh
sudo su - $USER
```

## Kubelet config

> failed to load Kubelet config file /var/lib/kubelet/config.yaml, error failed to read kubelet config file "/var/lib/kubelet/config.yaml", error: open /var/lib/kubelet/config.yaml: no such file or directory

```sh
sudo kubeadm init
```
