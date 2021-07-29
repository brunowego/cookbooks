# Alertmanager

## Alternatives

- [Cabot](/cabot.md)
- [Openduty](/openduty.md)
- Arachnys
- Atlassian Opsgenie
- PagerDuty
- VictorOps (Splunk)

## Links

- [Code Repository](https://github.com/prometheus/alertmanager)

## Docker

### Dependencies

- [Prometheus](/prometheus/README.md)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h alertmanager \
  -v alertmanager-data:/alertmanager \
  -p 9093:9093 \
  --name alertmanager \
  --network workbench \
  docker.io/prom/alertmanager:v0.22.2
```

```sh
#
docker exec -i prometheus /bin/sh -c 'sed -i "s/# \(- alertmanager:9093\)/\1/g" /etc/prometheus/prometheus.yml'

#
docker restart prometheus

#
echo -e '[INFO]\thttp://127.0.0.1:9093'
```

### Rules

#### Node Exporter

**Dependencies:** [Node Exporter for Prometheus](/prometheus/exporters/node_exporter.md).

```sh
#
docker exec -i prometheus /bin/sh << EOSHELL
cat << EOF > /etc/prometheus/rules.yml
groups:
- name: example
  rules:
  - alert: InstanceDown
    expr: up == 0
    for: 1m
    labels:
      severity: critical
    annotations:
      summary: Instance is down

EOF
EOSHELL

#
docker exec -i prometheus /bin/sh -c 'sed -i "/rule_files:/a\  - \"rules.yml\"" /etc/prometheus/prometheus.yml'

#
docker exec -i prometheus /bin/sh << EOSHELL
cat << EOF >> /etc/prometheus/prometheus.yml

  - job_name: 'node_exporter'
    static_configs:
    - targets: ['node-exporter:9100']
EOF
EOSHELL

#
docker restart prometheus
```

### Remove

```sh
docker rm -f alertmanager

docker volume rm alertmanager-data
```
