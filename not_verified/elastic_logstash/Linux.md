# Linux

## Installation

### YUM

```sh
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/elastic.repo
[logstash-6.x]
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
sudo yum -y install logstash
```

```sh
sudo ln -s /usr/share/logstash/bin/logstash /usr/bin
```

### APT

```sh
sudo apt update

wget -O - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt -y install apt-transport-https

echo 'deb https://artifacts.elastic.co/packages/6.x/apt stable main' | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list

sudo apt update -y
```

```sh
sudo apt -y install logstash
```

## Service

```sh
sudo systemctl enable --now logstash
```
