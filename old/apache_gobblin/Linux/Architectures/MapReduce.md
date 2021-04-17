# MapReduce

## Environment

```sh
sudo /usr/bin/sh -c 'echo -e "\nexport JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))" >> /opt/gobblin/bin/gobblin-env.sh'
```

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
sudo tee -a /opt/gobblin/conf/gobblin-mapreduce.properties << 'EOF'
# Directory where failure log files are stored
failure.log.dir=${env:GOBBLIN_WORK_DIR}/failure
EOF
```

```sh
sudo tee /usr/lib/systemd/system/gobblin-mapreduce.service << EOF
[Unit]
Description=Gobblin MapReduce
Documentation=https://gobblin.readthedocs.io
After=network.target

[Service]
Type=oneshot
User=gobblin
Group=gobblin
WorkingDirectory=/opt/gobblin
ExecStart=/opt/gobblin/bin/gobblin-mapreduce.sh --conf $GOBBLIN_JOB_CONFIG_FILE
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo tee /etc/sysconfig/gobblin << EOF
GOBBLIN_JOB_CONFIG_FILE=/etc/gobblin/job.pull
GOBBLIN_WORK_DIR=/var/lib/gobblin
GOBBLIN_LOG_DIR=/var/log/gobblin
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/gobblin-mapreduce.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/gobblin" >> /etc/systemd/system/gobblin-mapreduce.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now gobblin-mapreduce
```

## Logs

```sh
tail -f /var/log/gobblin/gobblin-current.log
```

```sh
tail -f /var/log/gobblin/gobblin-gc.log
```
