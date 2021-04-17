# Kafka

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin kafka
```

```sh
sudo usermod -aG kafka "$USER" && sudo su - "$USER"
```

```sh
sudo install -dm 775 -o kafka -g kafka /var/lib/kafka
```

```sh
sudo sed -i '/^log.dirs=/s|/tmp/kafka-logs|/var/lib/kafka|g' /opt/kafka/config/server.properties
```

```sh
sudo install -dm 775 -o kafka -g kafka /var/log/kafka
```

## Service

```sh
sudo tee /usr/lib/systemd/system/kafka.service << 'EOF'
[Unit]
Description=Kafka Distributed Streaming Platform
Documentation=https://kafka.apache.org/documentation/
After=network.target zookeeper.service

[Service]
Type=forking
User=kafka
Group=kafka
WorkingDirectory=/opt/kafka
ExecStart=/opt/kafka/bin/kafka-server-start.sh -daemon /opt/kafka/config/server.properties
ExecStop=/opt/kafka/bin/kafka-server-stop.sh
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo /usr/bin/sh -c 'echo "LOG_DIR=/var/log/kafka" >> /etc/sysconfig/kafka'
```

```sh
sudo mkdir -p /etc/systemd/system/kafka.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/kafka" >> /etc/systemd/system/kafka.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now kafka
```

## Logs

```sh
tail -f /var/log/kafka/kafkaServer.out
```
