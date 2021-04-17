# API

##

```sh
sudo mkdir -p /etc/systemd/system/docker.service.d
```

```sh
sudo tee /etc/systemd/system/docker.service.d/overrides.conf << EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl show --property ExecStart docker
sudo systemctl restart docker
```

##

```sh
sudo mkdir -p /etc/sysconfig
```

```sh
sudo /usr/bin/sh -c 'echo "DOCKER_OPTS=\"-D --tls=false -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock\"" >> /etc/sysconfig/docker'
```

```sh
sudo mkdir -p /etc/systemd/system/docker.service.d
```

```sh
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/docker" >> /etc/systemd/system/docker.service.d/http-proxy.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl show --property EnvironmentFiles docker
sudo systemctl restart docker
```
