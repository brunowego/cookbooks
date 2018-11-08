# Linux

## Dependencies

### APT

```sh
sudo apt update
sudo apt -y install curl
```

### YUM

```sh
sudo yum check-update
sudo yum -y install curl
```

## Installation

```sh
curl -L https://github.com/prometheus/prometheus/releases/download/v2.6.1/prometheus-2.6.1.linux-amd64.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/prometheus-2.6.1.linux-amd64 /opt/prometheus
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin prometheus
```

```sh
sudo usermod -aG prometheus $USER && sudo su - $USER
```

## Environment

```sh
sudo mkdir -p /etc/prometheus
```

```sh
sudo cp /opt/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
```

```sh
sudo chown -R flume: /etc/prometheus
sudo chmod -R 775 /etc/prometheus
```

```sh
sudo install -dm 775 -o prometheus -g prometheus /var/lib/prometheus
```

## Service

```sh
sudo tee /usr/lib/systemd/system/prometheus.service << EOF
[Unit]
Description=Prometheus Monitoring System
Documentation=https://prometheus.io/docs/introduction/overview/
After=network.target

[Service]
Type=simple
User=prometheus
Group=prometheus
WorkingDirectory=/opt/prometheus
ExecStart=/opt/prometheus/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now prometheus
```
