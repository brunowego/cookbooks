# Standalone

## Configuration

```sh
sudo install -dm 775 -o gobblin -g gobblin /etc/gobblin
```

```sh
sudo install -dm 775 -o gobblin -g gobblin /var/lib/gobblin
```

```sh
sudo install -dm 775 -o gobblin -g gobblin /var/log/gobblin
```

## Service

```sh
sudo tee -a /opt/gobblin/conf/gobblin-standalone.properties << 'EOF'
# Directory where failure log files are stored
failure.log.dir=${env:GOBBLIN_WORK_DIR}/failure
EOF
```

```sh
sudo tee /usr/lib/systemd/system/gobblin-standalone.service << EOF
[Unit]
Description=Gobblin Standalone
Documentation=https://gobblin.readthedocs.io
After=network.target

[Service]
Type=oneshot
User=gobblin
Group=gobblin
Environment=JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
WorkingDirectory=/opt/gobblin
ExecStart=/opt/gobblin/bin/gobblin-standalone.sh start
ExecStop=/opt/gobblin/bin/gobblin-standalone.sh stop
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo tee -a /etc/sysconfig/gobblin << EOF
GOBBLIN_FWDIR=/opt/gobblin
GOBBLIN_JOB_CONFIG_DIR=/etc/gobblin
GOBBLIN_WORK_DIR=/var/lib/gobblin
GOBBLIN_LOG_DIR=/var/log/gobblin
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/gobblin-standalone.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/gobblin" >> /etc/systemd/system/gobblin-standalone.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now gobblin-standalone
```

## Logs

```sh
tail -f /var/log/gobblin/gobblin-current.log
```

```sh
tail -f /var/log/gobblin/gobblin-gc.log
```
