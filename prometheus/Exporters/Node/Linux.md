# Installation

## Linux

```sh
curl -L https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/node_exporter-0.17.0.linux-amd64 /opt/node_exporter
```

## Service

```sh
sudo tee /usr/lib/systemd/system/node_exporter.service << EOF
[Unit]
Description=Node Exporter

[Service]
ExecStart=/opt/node_exporter/node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now node_exporter
```
