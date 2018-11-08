# Linux

## Installation

```sh
curl -L https://github.com/prometheus/blackbox_exporter/releases/download/v0.13.0/blackbox_exporter-0.13.0.linux-amd64.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/blackbox_exporter-0.13.0.linux-amd64 /opt/blackbox_exporter
```

## Configuration

```sh
sudo tee /etc/blackbox_exporter.yml << EOF
modules:
  http_2xx:
    prober: http
    http:

  http_post_2xx:
    prober: http
    http:
      method: POST

  tcp_connect:
    prober: tcp

  pop3s_banner:
    prober: tcp
    tcp:
      query_response:
      - expect: "^+OK"
      tls: true
      tls_config:
        insecure_skip_verify: false

  ssh_banner:
    prober: tcp
    tcp:
      query_response:
      - expect: "^SSH-2.0-"

  irc_banner:
    prober: tcp
    tcp:
      query_response:
      - send: "NICK prober"
      - send: "USER prober prober prober :prober"
      - expect: "PING :([^ ]+)"
        send: "PONG ${1}"
      - expect: "^:[^ ]+ 001"

  icmp:
    prober: icmp

  dns:
    prober: dns
    timeout: 5s
    dns:
       query_name: ${domain}
EOF
```

## Service

```sh
sudo tee /usr/lib/systemd/system/blackbox_exporter.service << EOF
[Unit]
Description=Blackbox Exporter

[Service]
WorkingDirectory=/opt/blackbox_exporter
ExecStart=/opt/blackbox_exporter/blackbox_exporter --config.file /etc/blackbox.yml
Restart=always

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now blackbox_exporter
```
