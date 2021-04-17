# Yet Another Resource Negotiator (YARN)

## Environment

```sh
sudo useradd -g hadoop -Mrs /bin/false yarn
```

## Configuration

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/yarn-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'yarn.nodemanager.local-dirs' /opt/hadoop/etc/hadoop/yarn-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v '/var/data/hadoop/nm-local-dir' /opt/hadoop/etc/hadoop/yarn-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/yarn-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'yarn.timeline-service.leveldb-timeline-store.path' /opt/hadoop/etc/hadoop/yarn-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v '/var/data/hadoop/yarn/timeline' /opt/hadoop/etc/hadoop/yarn-site.xml
```

## Service

### ResourceManager

```sh
sudo tee /usr/lib/systemd/system/yarn-resourcemanager.service << EOF
[Unit]
Description=YARN ResourceManager
After=network.target

[Service]
Type=forking
User=yarn
Group=hadoop
ExecStart=/opt/hadoop/bin/yarn --daemon start resourcemanager
ExecStop=/opt/hadoop/bin/yarn --daemon stop resourcemanager
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=default.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now yarn-resourcemanager
```

#### Logs

```sh
tail -f /var/log/hadoop/hadoop-yarn-resourcemanager-*.log
```

```sh
tail -f /var/log/hadoop/hadoop-yarn-resourcemanager-*.out
```

### NodeManager

```sh
sudo tee /usr/lib/systemd/system/yarn-nodemanager.service << EOF
[Unit]
Description=YARN NodeManager
Wants=yarn-resourcemanager.service
After=network.target

[Service]
Type=forking
User=hdfs
Group=hadoop
ExecStart=/opt/hadoop/bin/yarn --daemon start nodemanager
ExecStop=/opt/hadoop/bin/yarn --daemon stop nodemanager
Restart=on-failure

[Install]
WantedBy=default.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now yarn-nodemanager
```

#### Logs

```sh
tail -f /var/log/hadoop/hadoop-hdfs-nodemanager-*.log
```

```sh
tail -f /var/log/hadoop/hadoop-hdfs-nodemanager-*.out
```

### Timeline Server

```sh
sudo tee /usr/lib/systemd/system/yarn-timelineserver.service << EOF
[Unit]
Description=YARN Timeline Server
After=network.target

[Service]
Type=forking
User=yarn
Group=hadoop
ExecStart=/opt/hadoop/bin/yarn --daemon start timelineserver
ExecStop=/opt/hadoop/bin/yarn --daemon stop timelineserver
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=default.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now yarn-timelineserver
```

#### Logs

```sh
tail -f /var/log/hadoop/hadoop-yarn-timelineserver-*.log
```

```sh
tail -f /var/log/hadoop/hadoop-yarn-timelineserver-*.out
```

## Logs

```sh
tail -f /var/log/hadoop/SecurityAuth-*.audit
```
