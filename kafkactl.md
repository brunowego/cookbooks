# kafkactl

## CLI

### Installation

#### Homebrew

```sh
brew install jbvmio/tap/kafkactl
```

#### YUM

```sh
yum check-update
sudo yum -y install https://github.com/jbvmio/kafkactl/releases/download/v1.0.23/kafkactl_1.0.23_linux_amd64.rpm
```

### DPKG

```sh
wget https://github.com/jbvmio/kafkactl/releases/download/v1.0.23/kafkactl_1.0.23_linux_amd64.deb
sudo dpkg -i kafkactl_1.0.23_linux_amd64.deb && rm -f kafkactl_1.0.23_linux_amd64.deb
```

### Commands

```sh
kafkactl -h
```

```sh
kafkactl admin -h
```

```sh
kafkactl zk -h
```

### Examples

#### Info

```sh
kafkactl --broker [hostname]:9092
```

#### Config

```sh
kafkactl --broker [hostname]:9092 config view
```

### Issues

#### Lookup

```log
Error getting cluster metadata: dial tcp: lookup kafka on \[IPv6]:53: no such host
```

```sh
# Using shell
sudo /usr/bin/sh -c 'echo -e "127.0.0.1\tkafka" >> /etc/hosts'

# Using hostess
sudo hostess add 127.0.0.1 kafka
```
