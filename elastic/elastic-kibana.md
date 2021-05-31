# Elastic Kibana

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h elasticsearch \
  -e discovery.type=single-node \
  -v elasticsearch-config:/usr/share/elasticsearch/config \
  -v elasticsearch-data:/usr/share/elasticsearch/data \
  -v elasticsearch-logs:/usr/share/elasticsearch/logs \
  -p 9200:9200 \
  -p 9300:9300 \
  --name elasticsearch \
  docker.io/library/elasticsearch:7.5.0
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kibana \
  -e ELASTICSEARCH_HOSTS=http://elasticsearch:9200 \
  -v kibana-config:/usr/share/kibana/config \
  -v kibana-data:/usr/share/kibana/data \
  -p 5601:5601 \
  --name kibana \
  docker.io/library/kibana:7.5.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:5601'
```

### Remove

```sh
docker rm -f elasticsearch kibana
docker volume rm elasticsearch-config elasticsearch-data elasticsearch-logs kibana-config kibana-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install kibana
```

#### YUM

```sh
sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/elastic.repo
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
yum check-update
sudo yum -y install kibana
```

```sh
sudo ln -s /usr/share/kibana/bin/kibana /usr/bin
```

### Configuration

```sh
sed -i 's/^#server.host: .*/server.host: "127.0.0.1"/' /etc/kibana/kibana.yml
```

### Service

#### Linux

```sh
sudo systemctl enable --now kibana
```
