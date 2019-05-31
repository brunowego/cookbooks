# Running

## Environment

```sh
sudo sed -ri 's/^# export JAVA_HOME=.+/export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))/g' /usr/local/hbase/conf/hbase-env.sh
```

```sh
sudo install -dm 775 -o hbase -g hbase /var/log/hbase
```

```sh
sudo sed -ri 's|^# export HBASE_LOG_DIR=.+|export HBASE_LOG_DIR=/var/log/hbase|g' /usr/local/hbase/conf/hbase-env.sh
```

## Service

### Master

```sh
sudo tee /usr/lib/systemd/system/hbase-master.service << EOF
[Unit]
Description=HBase Master
Documentation=https://hbase.apache.org/book.html
After=network.target

[Service]
Type=simple
User=hbase
Group=hbase
WorkingDirectory=/usr/local/hbase
ExecStart=/usr/local/hbase/bin/hbase master start
ExecStop=/usr/local/hbase/bin/hbase master stop
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hbase-master
```

### RegionServer

```sh
sudo tee /usr/lib/systemd/system/hbase-regionserver.service << EOF
[Unit]
Description=HBase RegionServer
Documentation=https://hbase.apache.org/book.html
After=network.target

[Service]
Type=simple
User=hbase
Group=hbase
WorkingDirectory=/usr/local/hbase
ExecStart=/usr/local/hbase/bin/hbase regionserver start
ExecStop=/usr/local/hbase/bin/hbase regionserver stop
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hbase-regionserver
```

### Thrift Gateway

```sh
sudo tee /usr/lib/systemd/system/hbase-thrift.service << EOF
[Unit]
Description=HBase Thrift Gateway
Documentation=https://hbase.apache.org/book.html
After=network.target

[Service]
Type=simple
User=hbase
Group=hbase
WorkingDirectory=/usr/local/hbase
ExecStart=/usr/local/hbase/bin/hbase thrift start
ExecStop=/usr/local/hbase/bin/hbase thrift stop
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hbase-thrift
```

### REST Gateway

```sh
sudo tee /usr/lib/systemd/system/hbase-rest.service << EOF
[Unit]
Description=HBase REST Gateway
Documentation=https://hbase.apache.org/book.html
After=network.target

[Service]
Type=simple
User=hbase
Group=hbase
WorkingDirectory=/usr/local/hbase
ExecStart=/usr/local/hbase/bin/hbase rest start
ExecStop=/usr/local/hbase/bin/hbase rest stop
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hbase-rest
```

## Logs

TODO
