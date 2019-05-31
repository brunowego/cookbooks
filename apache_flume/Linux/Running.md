# Running

## Environment

```sh
sudo install -dm 775 -o flume -g flume /etc/flume-ng
```

```sh
sudo mv /opt/apache-flume/conf/flume-env.sh.template /opt/apache-flume/conf/flume-env.sh
```

```sh
sudo sed -ri 's/^# export JAVA_HOME=.+/export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))/g' /opt/apache-flume/conf/flume-env.sh
```

```sh
sudo install -dm 775 -o flume -g flume /var/log/flume-ng
```

```sh
sudo sed -i '/^flume.log.dir=/s|./logs|/var/log/flume-ng|g' /opt/apache-flume/conf/log4j.properties
```

## Service

```sh
sudo tee /usr/lib/systemd/system/flume-ng.service << EOF
[Unit]
Description=Flume Data Transfer
Documentation=https://flume.apache.org/documentation.html
After=network.target

[Service]
Type=simple
User=flume
Group=flume
WorkingDirectory=/opt/apache-flume
ExecStart=/opt/apache-flume/bin/flume-ng agent -c /opt/apache-flume/conf -n [name] -f /etc/flume-ng/[name].conf
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now flume-ng
```

## Logs

```sh
tail -f /var/log/flume-ng/flume.log
```
