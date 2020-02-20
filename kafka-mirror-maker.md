# Kafka Mirroring (MirrorMaker)

## CLI

### Examples

#### Running

```sh
kafka-mirror-maker \
 --consumer.config /opt/kafka/config/consumer.properties \
 --producer.config /opt/kafka/config/producer.properties \
 --num.streams [integer] \
 --whitelist [topic]
```

#### Groups

```sh
kafka-consumer-groups \
 --bootstrap-server [hostname]:9092
 --describe
 --group [name]
```

#### Checker

```sh
kafka-consumer-offset-checker \
 --group KafkaMirror \
 --zkconnect [hostname]:2181 \
 --topic [name]
```

## Host

### Configuration

```sh
sudo useradd -Mrs /sbin/nologin kafka
```

```sh
sudo usermod -aG kafka "$USER" && sudo su - "$USER"
```

```sh
sudo install -dm 775 -o kafka -g kafka /etc/kafka-mirror-maker
```

```sh
sudo install -m 775 -o kafka -g kafka /opt/kafka/config/consumer.properties /etc/kafka-mirror-maker
```

```sh
sudo /usr/bin/sh -c 'e "\npartition.assignment.strategy=org.apache.kafka.clients.consumer.RoundRobinAssignor" >> /etc/kafka-mirror-maker/consumer.properties'
```

```sh
sudo install -m 775 -o kafka -g kafka /opt/kafka/config/producer.properties /etc/kafka-mirror-maker
```

```sh
sudo install -dm 775 -o kafka -g kafka /var/log/kafka-mirror-maker
```

### Service

```sh
sudo tee /usr/lib/systemd/system/kafka-mirror-maker.service << 'EOF'
[Unit]
Description=Kafka Mirroring (MirrorMaker)
Documentation=https://kafka.apache.org/documentation/#basic_ops_mirror_maker
After=network.target

[Service]
Type=simple
User=kafka
Group=kafka
WorkingDirectory=/opt/kafka
ExecStart=/opt/kafka/bin/kafka-mirror-maker.sh \
  --consumer.config /etc/kafka-mirror-maker/consumer.properties \
  --producer.config /etc/kafka-mirror-maker/producer.properties \
  --num.streams $KAFKA_MIRROR_MAKER_NUM_STREAMS \
  --whitelist "$KAFKA_MIRROR_MAKER_WHITELIST"
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo tee /etc/sysconfig/kafka-mirror-maker << EOF
LOG_DIR=/var/log/kafka-mirror-maker

KAFKA_MIRROR_MAKER_NUM_STREAMS=1
KAFKA_MIRROR_MAKER_WHITELIST=.*
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/kafka-mirror-maker.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/kafka-mirror-maker" >> /etc/systemd/system/kafka-mirror-maker.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now kafka-mirror-maker
```
