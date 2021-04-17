# Runserver

## Service

```sh
sudo tee /usr/lib/systemd/system/superset-runserver.service << EOF
[Unit]
Description=Superset Run Server
Documentation=https://superset.incubator.apache.org/
After=network.target

[Service]
Type=simple
User=superset
Group=superset
ExecStart=$(which superset) runserver -d
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/superset-runserver.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/superset" >> /etc/systemd/system/superset-runserver.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now superset-runserver
```
