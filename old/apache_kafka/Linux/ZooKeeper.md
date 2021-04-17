# ZooKeeper

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin zookeeper
```

```sh
sudo usermod -aG zookeeper "$USER" && sudo su - "$USER"
```

```sh
sudo install -dm 775 -o zookeeper -g zookeeper /var/lib/zookeeper
```

```sh
sudo sed -ie '/^dataDir=/s|/tmp/zookeeper|/var/lib/zookeeper|g' /opt/kafka/config/zookeeper.properties
```

```sh
sudo install -dm 775 -o zookeeper -g zookeeper /var/log/zookeeper
```

## Service

```sh
sudo tee /usr/lib/systemd/system/zookeeper.service << 'EOF'
[Unit]
Description=Zookeeper Distributed Coordination Server
Documentation=http://zookeeper.apache.org/doc/current/
After=network.target

[Service]
Type=forking
User=zookeeper
Group=zookeeper
WorkingDirectory=/opt/kafka
ExecStart=/opt/kafka/bin/zookeeper-server-start.sh -daemon /opt/kafka/config/zookeeper.properties
ExecStop=/opt/kafka/bin/zookeeper-server-stop.sh
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo /usr/bin/sh -c 'echo "LOG_DIR=/var/log/zookeeper" >> /etc/sysconfig/zookeeper'
```

```sh
sudo mkdir -p /etc/systemd/system/zookeeper.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/zookeeper" >> /etc/systemd/system/zookeeper.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now zookeeper
```

## Logs

```sh
tail -f /var/log/zookeeper/zookeeper.out
```
