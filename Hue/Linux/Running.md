# Running

## Configuration

```sh
sudo sed -i "s/secret_key=/secret_key=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`/" /opt/hue/desktop/conf/pseudo-distributed.ini
```

```sh
sudo sed -i "/time_zone=/s|America/Los_Angeles|America/Sao_Paulo|g" /opt/hue/desktop/conf/pseudo-distributed.ini
```

hue syncdb --noinput
hue migrate --noinput

https://github.com/parrot-stream/docker-hue/blob/3d152b626d3fa5ebcaa666552ef5de778ac009f3/hue/build/env/bin/supervisord-bootstrap.sh
https://github.com/openschemas/dockerfiles/blob/137092f25ed95d8cb927556b4a4e7b62779c60de/data/m/mcapitanio/hue/Dockerfile

## Service

```sh
sudo tee /usr/lib/systemd/system/hue.service << EOF
[Unit]
Description=Hue Analytic Workbench
After=network.target zookeeper.service

[Service]
Type=forking
User=hue
Group=hadoop
ExecStart=/opt/hue/build/env/bin/hue runserver
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=default.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hue
```

## Logs

```sh
tail -f /opt/hue/logs/access.log
```

```sh
tail -f /opt/hue/logs/error.log
```

```sh
tail -f /opt/hue/logs/runserver.log
```
