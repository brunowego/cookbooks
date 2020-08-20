# Gunicorn

## Dependencies

```sh
pip install -U gevent
```

## Service

```sh
sudo tee /usr/lib/systemd/system/superset-gunicorn.service << EOF
[Unit]
Description=Superset Gunicorn
Documentation=https://superset.incubator.apache.org/
After=network.target

[Service]
Type=simple
User=superset
Group=superset
ExecStart=$(which gunicorn) -b 0.0.0.0:8088 -w 10 -k gevent -t 60 --limit-request-line 0 --limit-request-field_size 0 superset:app
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/superset-gunicorn.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/superset" >> /etc/systemd/system/superset-gunicorn.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now superset-gunicorn
```
