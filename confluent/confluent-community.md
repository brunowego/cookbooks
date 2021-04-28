# Confluent Community

## CLI

### Dependencies

- [Confluent](/confluent.md#repositories)

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install confluent-platform-oss-2.11
```

#### YUM

```sh
yum check-update
sudo yum -y install confluent-community-2.12
```

### Services

```sh
sudo systemctl enable --now confluent-kafka-rest
sudo systemctl enable --now confluent-zookeeper
sudo systemctl enable --now confluent-kafka
sudo systemctl enable --now confluent-schema-registry
sudo systemctl enable --now confluent-ksql
sudo systemctl enable --now confluent-kafka-connect
```
