# ZooKeeper

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin zookeeper
```

```sh
sudo usermod -aG zookeeper "$USER" && sudo su - "$USER"
```

```sh
sudo mkdir -p /opt/apache-druid/conf/zk
```

```sh
sudo tee /opt/apache-druid/conf/zk/jvm.config << EOF
-server
-Xms256m
-Xmx256m
-Duser.timezone=UTC
EOF
```

```sh
sudo tee /opt/apache-druid/conf/zk/zoo.cfg << EOF
tickTime=2000
initLimit=10
syncLimit=5
dataDir=var/zk
clientPort=2181
EOF
```

```sh
sudo mkdir -p /opt/apache-druid/zk/lib
```

```sh
sudo ln -s /opt/apache-druid/lib /opt/apache-druid/zk/lib
```

## Service

```sh
sudo tee /usr/lib/systemd/system/zookeeper.service << EOF
[Unit]
Description=Zookeeper Distributed Coordination Server
Documentation=http://zookeeper.apache.org/doc/current/
After=network.target

[Service]
Type=simple
User=zookeeper
Group=zookeeper
WorkingDirectory=/opt/apache-druid
ExecStart=/opt/apache-druid/bin/run-zk
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now zookeeper
```
