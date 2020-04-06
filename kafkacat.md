# kafkacat

## CLI

### References

- [Examples](https://github.com/edenhill/kafkacat#examples)
- [Running in Docker](https://github.com/edenhill/kafkacat#running-in-docker)

### Installation

#### Homebrew

```sh
brew install kafkacat
```

#### Source

##### Dependencies

###### APT

```sh
sudo apt update
sudo apt -y install build-essential git which make wget zlib1g-dev
```

###### YUM

```sh
yum check-update
sudo yum -y install git which make wget gcc-c++ zlib-devel
```

###### APK

```sh
sudo apk update
sudo apk add git bash make wget g++ zlib-dev
```

###### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core gcc-c++ which make wget
```

##### Build & Install

```sh
git clone --branch 1.4.0 --single-branch --depth 1 https://github.com/edenhill/kafkacat.git
( cd ./kafkacat && ./bootstrap.sh && sudo mv ./kafkacat /usr/local/bin ) && rm -fR ./kafkacat
```

### Commands

```sh
kafkacat -h
```

### Usage

```sh
# List brokers
kafkacat -Lb 127.0.0.1:9092

# Produce one registry
echo hello | kafkacat \
  -Pb 127.0.0.1:9092 \
  -t example \
  -p 0

# Consume first registry
kafkacat \
  -Cb 127.0.0.1:9092 \
  -t example \
  -o earliest \
  -c 1
```

<!-- ### Configuration

```sh
cat << EOF > kafkacat.conf
security.protocol=SSL
ssl.key.location=/var/lib/secret/client.pem
ssl.key.password=test1234
ssl.certificate.location=/var/lib/secret/client.pem
ssl.ca.location=/var/lib/secret/ca.pem
EOF
``` -->

### Tips

#### Kerberos Params

```sh
kafkacat -Lb [hostname]:9092 \
  -X security.protocol=SASL_PLAINTEXT \
  -X sasl.kerberos.service.name=kafka \
  -X sasl.kerberos.keytab=/etc/security/keytabs/[name].keytab \
  -X sasl.kerberos.principal=[username]/[FQDN]@[REALM]
```

### Issues

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
