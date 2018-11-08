# Linux

## Installation

```sh
curl -L https://github.com/jaegertracing/jaeger/releases/download/v1.9.0/jaeger-1.9.0-linux-amd64.tar.gz | sudo tar -xzC /usr/local/bin --no-same-owner --no-same-permissions --strip-components 1
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin jaeger
```

```sh
sudo usermod -aG jaeger $USER && sudo su - $USER
```

```sh
sudo install -dm 775 -o jaeger -g jaeger /etc/jaeger
```

```sh
sudo yq w -i /etc/jaeger/config.yaml log_level 'DEBUG'
```

## Service

### Environment

```sh
sudo tee /etc/sysconfig/jaeger << EOF
SPAN_STORAGE_TYPE=cassandra
EOF
```

### Collector

```sh
sudo tee /usr/lib/systemd/system/jaeger-collector.service << 'EOF'
[Unit]
Description=Jaeger Collector
Documentation=https://www.jaegertracing.io/docs/1.9/
Requires=cassandra.service
Wants=network-online.target
After=cassandra.service

[Service]
Type=simple
User=jaeger
Group=jaeger
PIDFile=/var/run/jaeger-collector.pid
ExecStart=/usr/local/bin/jaeger-collector --config-file /etc/jaeger/config.yaml
ExecStop=/bin/kill -s HUP $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/jaeger-collector.service.d
```

```sh
sudo sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/jaeger" >> /etc/systemd/system/jaeger-collector.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now jaeger-collector
```

### Agent

```sh
sudo tee /usr/lib/systemd/system/jaeger-agent.service << 'EOF'
[Unit]
Description=Jaeger Agent
Documentation=https://www.jaegertracing.io/docs/1.9/
Requires=cassandra.service
Wants=network-online.target
After=cassandra.service

[Service]
Type=simple
User=jaeger
Group=jaeger
PIDFile=/var/run/jaeger-agent.pid
ExecStart=/usr/local/bin/jaeger-agent --config-file /etc/jaeger/config.yaml
ExecStop=/bin/kill -s HUP $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/jaeger-agent.service.d
```

```sh
sudo sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/jaeger" >> /etc/systemd/system/jaeger-agent.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now jaeger-agent
```

### Query

```sh
sudo tee /usr/lib/systemd/system/jaeger-query.service << 'EOF'
[Unit]
Description=Jaeger Query
Documentation=https://www.jaegertracing.io/docs/1.9/
Requires=cassandra.service
Wants=network-online.target
After=cassandra.service

[Service]
Type=simple
User=jaeger
Group=jaeger
PIDFile=/var/run/jaeger-query.pid
ExecStart=/usr/local/bin/jaeger-query --config-file /etc/jaeger/config.yaml
ExecStop=/bin/kill -s HUP $MAINPID
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/jaeger-query.service.d
```

```sh
sudo sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/jaeger" >> /etc/systemd/system/jaeger-query.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now jaeger-query
```
