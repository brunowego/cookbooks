# Jaeger

## Helm

TODO

https://hub.helm.sh/charts/incubator/jaeger

## Host

### Installation

#### Linux

```sh
curl -L 'https://github.com/jaegertracing/jaeger/releases/download/v1.9.0/jaeger-1.9.0-linux-amd64.tar.gz' | sudo tar -xzC /usr/local/bin --no-same-owner --no-same-permissions --strip-components 1
```

### Configuration

#### Linux

```sh
sudo useradd -Mrs /sbin/nologin jaeger
```

```sh
sudo usermod -aG jaeger "$USER" && sudo su - "$USER"
```

```sh
sudo install -dm 775 -o jaeger -g jaeger /etc/jaeger
```

```sh
sudo yq w -i /etc/jaeger/config.yaml log_level 'DEBUG'
```

### Service

#### Linux

##### Environment

```sh
sudo tee /etc/sysconfig/jaeger << EOF
SPAN_STORAGE_TYPE=cassandra
EOF
```

##### Collector

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
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/jaeger" >> /etc/systemd/system/jaeger-collector.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now jaeger-collector
```

##### Agent

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
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/jaeger" >> /etc/systemd/system/jaeger-agent.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now jaeger-agent
```

##### Query

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
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/jaeger" >> /etc/systemd/system/jaeger-query.service.d/env-file.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now jaeger-query
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h jaeger-all-in-one \
  -e COLLECTOR_ZIPKIN_HTTP_PORT=9411 \
  -p 5775:5775/udp \
  -p 5778:5778 \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 9411:9411 \
  -p 14268:14268 \
  -p 16686:16686 \
  --name jaeger-all-in-one \
  docker.io/jaegertracing/all-in-one:1.14.0
```

```sh
xdg-open "http://127.0.0.1:16686" || open "http://127.0.0.1:16686" || echo -e "[INFO]\thttp://127.0.0.1:16686"
```

### Remove

```sh
docker rm -f jaeger-all-in-one
```
