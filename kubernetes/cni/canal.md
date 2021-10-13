# Canal Networking (Calico for policy and Flannel for networking)

## Custom Resource (CR)

### Initialize

```sh
# Default
sudo kubeadm init --pod-network-cidr '10.244.0.0/16'

# Personalized
yq w -id 1 ~/kubeadm-init-config.yaml networking.podSubnet '10.244.0.0/16'
```

```sh
sudo kubeadm init --config ~/kubeadm-init-config.yaml
```

#### Vagrant

```sh
sudo kubeadm init \
  --apiserver-advertise-address "$(hostname -I | awk '{print $2}')" \
  --pod-network-cidr '10.244.0.0/16'
```

### Apply

```sh
# Default
kubectl apply -f 'https://docs.projectcalico.org/v3.9/manifests/canal.yaml'

# Personalized
wget 'https://docs.projectcalico.org/v3.9/manifests/canal.yaml'

sed -i 's/quay.io/[your.hub.docker.com]/' ./canal.yaml
sed -i '/image: /s|calico/|[your.hub.docker.com]/calico/|' ./canal.yaml

kubectl apply -f ./canal.yaml

rm ./canal.yaml
```

### Tips

#### Behind Proxy

```sh
export no_proxy="$no_proxy,10.96.0.0/12,10.244.0.0/16,$(hostname -I | cut -d ' ' -f 1)"
export NO_PROXY="$no_proxy"
```

### Delete

```sh
kubectl delete -f 'https://docs.projectcalico.org/v3.9/manifests/canal.yaml'
```
