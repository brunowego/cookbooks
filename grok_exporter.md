# Grok Exporter for Prometheus

## CLI

### Dependencies

#### YUM

```sh
yum check-update
sudo yum -y install wget unzip
```

#### APT

```sh
sudo apt update
sudo apt -y install wget unzip
```

#### Linux Binary

```sh
wget https://github.com/fstab/grok_exporter/releases/download/v0.2.6/grok_exporter-0.2.6.linux-amd64.zip -O /tmp/grok_exporter.zip
( cd /tmp && sudo unzip grok_exporter.zip -d /opt && rm grok_exporter.zip )
sudo ln -s /opt/grok_exporter-0.2.6.linux-amd64 /opt/grok_exporter
```

## Configuration

```sh
# Linux
sudo tee /etc/grok_exporter.yml << EOF
global:
  config_version: 2

input:
  type: file
  path: /var/log/httpd/access.log
  readall: false

grok:
  patterns_dir: ./patterns

metrics:
  - type: counter
    name: apache_http_requests_total
    help: Total number of requests
    match: '%{COMMONAPACHELOG}'
    labels:
      method: '{{.verb}}'
      code: '{{.response}}'

server:
  host: 0.0.0.0
  port: 9144
EOF
```

## Service

```sh
# Systemd
sudo tee /usr/lib/systemd/system/grok_exporter.service << EOF
[Unit]
Description=Grok Exporter

[Service]
WorkingDirectory=/opt/grok_exporter
ExecStart=/opt/grok_exporter/grok_exporter --config /etc/grok_exporter.yml
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable --now grok_exporter
```
