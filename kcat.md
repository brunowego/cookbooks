# kcat (p.k.a kafkacat)

## CLI

### Links

- [Code Repository](https://github.com/edenhill/kcat)

### Guides

- [Examples](https://github.com/edenhill/kcat#examples)
- [Running in Docker](https://github.com/edenhill/kcat#running-in-docker)

### Installation

#### Homebrew

```sh
brew install kcat
```

#### APT

```sh
sudo apt update
sudo apt -y install kafkacat
```

#### Source

##### Dependencies

###### APT

```sh
sudo apt update;
sudo apt -y install \
  git \
  curl \
  pkg-config \
  zlib1g-dev \
  libzstd-dev \
  cmake \
  libcurl4-openssl-dev
```

###### YUM

```sh
yum check-update
sudo yum -y install \
  git \
  which \
  curl \
  make \
  gcc-c++ \
  cyrus-sasl-devel \
  cmake \
  libcurl-devel
```

##### Build & Install

```sh
git clone \
  --branch 1.7.0 \
  --single-branch \
  --depth 1 \
  'https://github.com/edenhill/kcat.git'

( cd ./kcat && ./bootstrap.sh && mv ./kcat /usr/local/bin ) && rm -fR ./kcat
```

### Commands

```sh
kcat -h
```

### Usage

```sh
# List brokers
kcat -Lb 127.0.0.1:9092

# Produce one registry
echo hello | kcat \
  -Pb 127.0.0.1:9092 \
  -t example \
  -p 0

# Consume first registry
kcat \
  -Cb 127.0.0.1:9092 \
  -t example \
  -o earliest \
  -c 1
```

<!-- ### Configuration

```sh
cat << EOF > kcat.conf
security.protocol=SSL
ssl.key.location=/var/lib/secret/client.pem
ssl.key.password=test1234
ssl.certificate.location=/var/lib/secret/client.pem
ssl.ca.location=/var/lib/secret/ca.pem
EOF
``` -->

### Tips

#### Using SASL SCRAM

```sh
kcat \
  -b [hostname]:9096 \
  -X security.protocol=SASL_SSL \
  -X sasl.mechanisms=SCRAM-SHA-512 \
  -X sasl.username=[username] \
  -X sasl.password=[password] \
  -L
```

#### Using Kerberos Keytab

```sh
kcat \
  -b [hostname]:9092 \
  -X security.protocol=SASL_PLAINTEXT \
  -X sasl.kerberos.service.name=kafka \
  -X sasl.kerberos.keytab=/etc/security/keytabs/[name].keytab \
  -X sasl.kerberos.principal=[username]/[FQDN]@[REALM] \
  -L
```

#### Using SSL Key

```sh
kcat \
  -b [hostname]:9093 \
  -X security.protocol=SSL \
  -X ssl.key.location=private_key.pem \
  -X ssl.key.password=[password] \
  -X ssl.certificate.location=signed_cert.pem \
  -X ssl.ca.location=ca_cert.pem \
  -L
```

### Issues

<!-- ####

```sh
% Fatal error at metadata_list:832:
% ERROR: Failed to acquire metadata: Local: Broker transport failure
```

```sh
kcat -V | grep builtin.features
``` -->

#### Linux Absent Alias

```sh
% ERROR: No such configuration property: "sasl.mechanism"
```

```sh
kcat -X list | grep sasl.mechanisms
```

Change parameter to `sasl.mechanisms`.

#### Host resolution

```log
% ERROR: Local: Host resolution failure: kafka:9092/1001: Failed to resolve 'kafka:9092': nodename nor servname provided, or not known (after 6ms in state CONNECT)
```

```sh
sudo hostess add kafka 127.0.0.1
```

#### Connection refused

```log
% ERROR: Local: Broker transport failure: localhost:9092/bootstrap: Connect to ipv6#[::1]:9092 failed: Connection refused (after 0ms in state CONNECT)
```

[Disable IPv6](/ipv6.md#disable) support.

## Kubectl

### Running

```sh
kubectl run -it --rm \
  kcat \
  --image docker.io/edenhill/kcat:1.7.0 \
  --restart 'Never' \
  -- -h
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kcat \
  --name kcat \
  --network workbench \
  docker.io/edenhill/kcat:1.7.0 -h
```
