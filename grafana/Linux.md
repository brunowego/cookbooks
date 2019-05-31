# Linux

## Installation

### YUM

```sh
sudo yum check-update
sudo yum localinstall -y https://dl.grafana.com/oss/release/grafana-5.4.3-1.x86_64.rpm
```

## Service

```sh
sudo systemctl enable --now grafana-server
```
