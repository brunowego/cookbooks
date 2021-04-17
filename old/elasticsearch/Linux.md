# Linux

## Installation

### YUM

```sh
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/elastic.repo
[elasticsearch-6.x]
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
yum check-update
sudo yum -y install elasticsearch
```

```sh
sudo ln -s /usr/share/elasticsearch/bin/elasticsearch /usr/bin
```

## Service

```sh
sudo systemctl enable --now elasticsearch
```
