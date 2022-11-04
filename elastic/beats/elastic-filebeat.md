# Elastic Filebeat

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h filebeat \
  --name elastic-filebeat \
  docker.io/elastic/filebeat:7.3.0 setup \
    -E setup.kibana.host='kibana:5601' \
    -E output.elasticsearch.hosts=['elasticsearch:9200']
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f filebeat
```

## CLI

### Installation

#### Homebrew

```sh
brew install filebeat
```

#### APT

```sh
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
```

```sh
echo 'deb https://artifacts.elastic.co/packages/7.x/apt stable main' | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
```

```sh
sudo apt update
sudo apt -y install filebeat
```

#### YUM

```sh
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/elastic-7.x.repo
[elastic-7.x]
name=Elastic repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md
EOF
```

```sh
yum check-update
sudo yum -y install filebeat
```

#### Chocolatey

```sh
choco install -y filebeat
```

### Commands

```sh
filebeat -h
```

#### Modules

```sh
filebeat modules list
```

#### Logs

```sh
sudo filebeat -c /etc/filebeat/filebeat.yaml -e
sudo filebeat -d 'publish' -e
sudo filebeat -d '*' -e
```
