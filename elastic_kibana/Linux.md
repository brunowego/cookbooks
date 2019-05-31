# Linux

## Installation

### YUM

```sh
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/Elastic-Kibana.repo
[kibana-6.x]
name=Elastic repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
```

```sh
sudo yum check-update
sudo yum -y install kibana
```

```sh
sudo ln -s /usr/share/kibana/bin/kibana /usr/bin
```

## Service

```sh
sudo systemctl enable --now kibana
```
