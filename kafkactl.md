# kafkactl

## Links

- [Code Repository](https://github.com/deviceinsight/kafkactl)

## CLI

### Installation

#### Homebrew

```sh
brew tap deviceinsight/packages
brew install kafkactl
```

#### RPM

```sh
curl -LO 'https://github.com/deviceinsight/kafkactl/releases/download/v1.23.0/kafkactl_1.23.0_linux_amd64.rpm'

sudo rpm -vi ./kafkactl_1.23.0_linux_amd64.rpm && \
  rm -f ./kafkactl_1.23.0_linux_amd64.rpm
```

#### DPKG

```sh
curl -LO 'https://github.com/deviceinsight/kafkactl/releases/download/v1.23.0/kafkactl_1.23.0_linux_amd64.deb'

sudo dpkg -i ./kafkactl_1.23.0_linux_amd64.deb && \
  rm -f ./kafkactl_1.23.0_linux_amd64.deb
```

### Commands

```sh
kafkactl -h
```

### [Configuration](https://github.com/deviceinsight/kafkactl#create-a-config-file)

```sh
#
mkdir -p ~/.config/kafkactl

#
cat << EOF > ~/.config/kafkactl/config.yml
---
contexts:
  default:
    brokers:
    - [hostname]:9092
    - [hostname]:9092

    tls:
      enabled: true

    sasl:
      enabled: true
      username: admin
      password: admin
      mechanism: scram-sha512

current-context: default
EOF

#
kafkactl config view
kafkactl config current-context
kafkactl config get-contexts
kafkactl config use-context default
```

### Usage

```sh
#
kafkactl get brokers

#
kafkactl get topics

#
kafkactl get consumer-groups
kafkactl get consumer-groups --topic [my-topic]

#
kafkactl describe consumer-group [my-group]

#
kafkactl alter topic [my-topic] \
  --partitions 20

#
kafkactl get acl
```

### Issues

#### Enable TLS

```log
failed to create cluster admin: kafka: client has run out of available brokers to talk to (Is your cluster reachable?)
```

```yaml
---
contexts:
  default:
    # ...
    tls:
      enabled: true
# ...
```

<!-- #### Lookup

```log
Error getting cluster metadata: dial tcp: lookup kafka on \[IPv6]:53: no such host
```

```sh
# Using shell
sudo /usr/bin/sh -c 'echo -e "127.0.0.1\tkafka" >> /etc/hosts'

# Using hostess
sudo hostess add 127.0.0.1 kafka
``` -->
