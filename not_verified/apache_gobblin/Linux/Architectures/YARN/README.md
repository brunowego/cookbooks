# YARN

## Configuration

```sh
sudo usermod -aG hadoop gobblin
```

```sh
sudo install -dm 775 -o gobblin -g gobblin /var/lib/gobblin
```

```sh
sudo sed -i '/^gobblin.yarn.work.dir=/s|/gobblin|/var/lib/gobblin|g' /opt/gobblin/conf/yarn/reference.conf
```

```sh
sudo install -dm 775 -o gobblin -g gobblin /etc/gobblin
```

```sh
sudo sed -i '/^gobblin.yarn.conf.dir=/s|<.*>|/opt/gobblin/conf/yarn|g' /opt/gobblin/conf/yarn/application.conf
sudo sed -i '/^gobblin.yarn.lib.jars.dir=/s|<.*>|/opt/gobblin/lib|g' /opt/gobblin/conf/yarn/application.conf
sudo sed -i '/^gobblin.yarn.logs.sink.root.dir=/s|<.*>|${gobblin.yarn.work.dir}/applogs|g' /opt/gobblin/conf/yarn/application.conf
sudo sed -i '/^gobblin.cluster.job.conf.path=/s|<.*>|/etc/gobblin|g' /opt/gobblin/conf/yarn/application.conf
```

```sh
sudo sed -i '/^PID=/s|$FWDIR|/tmp|g' /opt/gobblin/bin/gobblin-yarn.sh
```

## Environment

```sh
sudo /usr/bin/sh -c 'echo -e "\nexport JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))" >> /opt/gobblin/bin/gobblin-env.sh'
```

## Service

```sh
sudo tee /usr/lib/systemd/system/gobblin-yarn.service << EOF
[Unit]
Description=Gobblin YARN
Documentation=https://gobblin.readthedocs.io
After=network.target zookeeper.service

[Service]
Type=forking
User=hdfs # FIXME: Change it to gobblin
Group=hadoop
WorkingDirectory=/opt/gobblin
ExecStart=/opt/gobblin/bin/gobblin-yarn.sh start
ExecStop=/opt/gobblin/bin/gobblin-yarn.sh stop
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now gobblin-yarn
```

## Logs

```sh
tail -f ./nohup.out
```
