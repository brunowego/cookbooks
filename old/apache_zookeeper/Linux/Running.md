# Running

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin zookeeper
```

```sh
sudo usermod -aG zookeeper "$USER" && sudo su - "$USER"
```

```sh
( cd /opt/zookeeper/conf && sudo cp zoo_sample.cfg zoo.cfg )
```

```sh
sudo install -dm 775 -o zookeeper -g zookeeper /var/lib/zookeeper
```

```sh
sudo sed -ie '/^dataDir=/s|/tmp/zookeeper|/var/lib/zookeeper|g' /opt/zookeeper/conf/zoo.cfg
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
WorkingDirectory=/opt/zookeeper
ExecStart=/opt/zookeeper/bin/zkServer.sh start
PIDFile=/var/lib/zookeeper/zookeeper_server.pid
ExecStop=/bin/kill $MAINPID
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo /usr/bin/sh -c 'echo -e "ZOO_LOG_DIR=/var/log/zookeeper" >> /etc/sysconfig/zookeeper'
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
