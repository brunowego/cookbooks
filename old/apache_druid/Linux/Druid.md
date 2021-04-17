# Druid

## Configuration

```sh
sudo install -dm 775 -o druid -g druid /var/druid
```

### ZooKeeper

```sh
sudo sed -i '/^druid.zk.service.host/ s/zk.host.ip/127.0.0.1/g' /opt/apache-druid/conf/druid/_common/common.runtime.properties
```

### Coordinator

```sh
sudo sed -i 's/^-Xms3g/-Xms1g/' /opt/apache-druid/conf/druid/coordinator/jvm.config
```

```sh
sudo sed -i 's/^-Xmx3g/-Xmx1g/' /opt/apache-druid/conf/druid/coordinator/jvm.config
```

```sh
sudo tee -a /opt/apache-druid/conf/druid/coordinator/main.config << EOF
org.apache.druid.cli.Main server coordinator
EOF
```

### Broker

```sh
sudo sed -i 's/^-Xms24g/-Xms8g/' /opt/apache-druid/conf/druid/broker/jvm.config
```

```sh
sudo sed -i 's/^-Xmx24g/-Xmx8g/' /opt/apache-druid/conf/druid/broker/jvm.config
```

```sh
sudo tee -a /opt/apache-druid/conf/druid/broker/main.config << EOF
org.apache.druid.cli.Main server broker
EOF
```

```sh
sudo sed -i '/^druid.processing.buffer.sizeBytes/ s/536870912/64000000/g' /opt/apache-druid/conf/druid/broker/runtime.properties
```

### Historical

```sh
sudo sed -i 's/^-Xms8g/-Xms2g/' /opt/apache-druid/conf/druid/historical/jvm.config
```

```sh
sudo sed -i 's/^-Xmx8g/-Xmx2g/' /opt/apache-druid/conf/druid/historical/jvm.config
```

```sh
sudo tee -a /opt/apache-druid/conf/druid/historical/main.config << EOF
org.apache.druid.cli.Main server historical
EOF
```

```sh
sudo sed -i '/^druid.processing.buffer.sizeBytes/ s/536870912/64000000/g' /opt/apache-druid/conf/druid/historical/runtime.properties
```

## Service

### Coordinator

```sh
sudo tee /usr/lib/systemd/system/druid-coordinator.service << EOF
[Unit]
Description=Druid Coordinator
Documentation=http://druid.io/docs
After=network.target

[Service]
Type=simple
User=druid
Group=druid
WorkingDirectory=/opt/apache-druid
ExecStart=/opt/apache-druid/bin/run-druid coordinator
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now druid-coordinator
```

### Broker

```sh
sudo tee /usr/lib/systemd/system/druid-broker.service << EOF
[Unit]
Description=Druid Broker
Documentation=http://druid.io/docs
After=network.target

[Service]
Type=simple
User=druid
Group=druid
WorkingDirectory=/opt/apache-druid
ExecStart=/opt/apache-druid/bin/run-druid broker
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now druid-broker
```

### Historical

```sh
sudo tee /usr/lib/systemd/system/druid-historical.service << EOF
[Unit]
Description=Druid Historical
Documentation=http://druid.io/docs
After=network.target

[Service]
Type=simple
User=druid
Group=druid
WorkingDirectory=/opt/apache-druid
ExecStart=/opt/apache-druid/bin/run-druid historical
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now druid-historical
```

### Overlord

```sh
sudo tee /usr/lib/systemd/system/druid-overlord.service << EOF

EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now druid-overlord
```

### Middle Manager

```sh
sudo tee /usr/lib/systemd/system/druid-middlemanager.service << EOF

EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now druid-middlemanager
```

## Logrotate

```sh
sudo tee -a /etc/logrotate.d/druid << EOF
/var/log/druid/*.log {
    size 100M
    missingok
    rotate 3
    copytruncate
    delaycompress
    compress
    notifempty
}
EOF
```
