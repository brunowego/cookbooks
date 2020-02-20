# K8s Cluster

## References

- [Creating a single master cluster with kubeadm](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/)

## Dependencies

- [Docker CE](/docker-ce.md)
- [Kubeadm](/kubeadm.md)
- [Kubectl](/kubectl.md)

## Requirements

### CentOS

#### Disable Security-Enhanced (SE) Linux

```sh
sudo setenforce 0
```

```sh
sudo sed -i '/^SELINUX=/ s/enforcing/permissive/' /etc/selinux/config
```

### iptables

```sh
cat << EOF | sudo tee /etc/sysctl.d/90-bridge.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
```

```sh
sudo sysctl --system
```

### SWAP

```sh
sudo swapoff -a
```

```sh
# check exists
sudo sed 's:#.*::;/swap/p;d' /etc/fstab

# comment line
sudo sed -i '/^#/! s/.*swap.*/# \0/' /etc/fstab
```

## Configuration

### Personalized

```sh
kubeadm config print init-defaults \
  --component-configs KubeletConfiguration \
  > ~/kubeadm-init-config.yaml
```

```sh
sed -i '/^imageRepository: /s|k8s.gcr.io|[your.hub.docker.com]|' ~/kubeadm-init-config.yaml
sed -i "/^  advertiseAddress: /s|1.2.3.4|$(hostname -i)|" ~/kubeadm-init-config.yaml
sed -i "s/^kubernetesVersion: .*/kubernetesVersion: v$(kubectl version --client -o json | jq -r '.clientVersion.gitVersion | gsub("[v]"; "")')/" ~/kubeadm-init-config.yaml
```

```sh
docker login [your.hub.docker.com]
```

```sh
sudo mkdir -p /etc/docker
```

```sh
[[ ! -f '/etc/docker/daemon.json' ]] && sudo /usr/bin/sh -c 'echo "{}" >> /etc/docker/daemon.json'
```

```sh
sudo /usr/bin/sh -c 'jq ".\"insecure-registries\" += [ \"[your.hub.docker.com]\" ]" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

```sh
sudo systemctl restart docker
```

```sh
docker info | grep 'Insecure Registries' -A 1
```

## Initialize

### Master

#### Default

```sh
kubeadm config images list
```

```sh
kubeadm config images pull -v 4
```

#### Personalized

```sh
kubeadm config images list --config ~/kubeadm-init-config.yaml
```

```sh
kubeadm config images pull --config ~/kubeadm-init-config.yaml -v 4
```

#### Run Pre-flight

```sh
sudo kubeadm init --dry-run
```

#### Network

Choose a [pod network add-on](https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/#pod-network).

- [flannel](/flannel-network.md)
- [Calico](/calico-network.md)
- [Canal](/canal-network.md)

#### Rename Context

```sh
kubectl config current-context
```

```sh
sed -i "s/kubernetes/$(hostname -s)/" ~/.kube/config
```

#### Node Join

```sh
sudo kubeadm token create --print-join-command
```

<!-- ## Examples

###

```sh
kubeadm token list | awk '{ print $1 }' | awk NR==2 > /vagrant/token
```

###

```sh
kubectl run fun -it --rm \
  --image='quay.io/coreos/etcd:v3.3' \
  --restart='Never' \
  -- /bin/sh
``` -->

## Tips

### cgroup Driver

```sh
# for systemd
# Not need changes, systemd is Native.

# for cgroupfs
cat << EOF | sudo tee /etc/default/kubelet
KUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"
EOF
```

### Taint Master

```sh
kubectl taint nodes --all node-role.kubernetes.io/master-
```

### Kube Config

```sh
sudo chmod +r /etc/kubernetes/admin.conf
```

```sh
sudo /usr/bin/sh -c 'echo "export KUBECONFIG=/etc/kubernetes/admin.conf" >> /etc/profile.d/kube.sh'
```

```sh
sudo su - "$USER"
```

## Reset

```sh
sudo kubeadm reset -f
```

## Issues

### Docker Validated Versions

```log
[WARNING SystemVerification]: this Docker version is not on the list of validated versions: 19.03.2. Latest validated version: 18.09
```

```sh
# APT
apt list -a docker-ce
sudo apt --allow-downgrades -y install docker-ce=5:18.09.9~3-0~ubuntu-bionic

# YUM
yum list docker-ce --showduplicates | sort -r
sudo yum -y downgrade docker-ce-18.09.9-3.el7
```

### Hostname Lookup

```log
[WARNING Hostname]: hostname "[hostname]" could not be reached
[WARNING Hostname]: hostname "[hostname]": lookup [hostname] on [ip]:53: no such host
```

```sh
sudo hostess add "$(hostname)" 127.0.0.1
```

<!-- #### Could not fetch a Kubernetes version from the internet

```log
Get https://dl.k8s.io/release/stable-1.txt: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
```

Set HTTP proxy environment. -->

<!-- #### Connection uses proxy

```log
If that is not intended, adjust your proxy settings
```

```sh
export no_proxy="$no_proxy,$(ip route get 1 | awk '{print $NF;exit}')"
export NO_PROXY=$no_proxy
```

```log
For linux environment, persist this configuration on `/etc/profile.d/no-proxy.sh`.
```

```sh
sudo su - "$USER"
``` -->

<!-- #### Kubelet config

```log
failed to load Kubelet config file /var/lib/kubelet/config.yaml, error failed to read kubelet config file "/var/lib/kubelet/config.yaml", error: open /var/lib/kubelet/config.yaml: no such file or directory
```

```sh
sudo kubeadm init
``` -->

<!-- ####

```log
Error: release rancher failed: Internal error occurred: failed calling webhook "issuers.admission.certmanager.k8s.io": Post https://kubernetes.default.svc:443/apis/admission.certmanager.k8s.io/v1beta1/issuers?timeout=30s: x509: certificate is valid for kubernetes.default.svc, not apiserver-loopback-client
```

```sh
export no_proxy=$no_proxy,kubernetes.default.svc
export NO_PROXY=$no_proxy
```

```sh
nslookup kubernetes.default.svc.cluster.local
```

```sh
sudo vim /etc/kubernetes/manifests/kube-apiserver.yaml
```

```sh
sudo systemctl restart kubelet
```

```sh
kubectl get pod -l 'component=kube-apiserver' -o jsonpath='{.items[0].spec.containers[0].env}' -n kube-system
``` -->
