# Kubeadm

## CLI

### Installation

#### APT

```sh
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
```

```sh
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```

```sh
sudo apt update
sudo apt -y install kubelet kubeadm
```

#### YUM

```sh
cat << EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF
```

```sh
sudo yum -y check-update
sudo yum -y install kubelet kubeadm --disableexcludes=kubernetes
```

### Service

```sh
sudo systemctl enable --now kubelet
```

### Commands

```sh
kubeadm -h
```

### Logs

```sh
sudo journalctl -u kubelet
```
