# Prometheus Alertmanager

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h alertmanager \
  -v alertmanager-data:/alertmanager \
  -p 9093:9093 \
  --name alertmanager \
  docker.io/prom/alertmanager:v0.20.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9093'
```

```sh
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
alerting:
  alertmanagers:
  - static_configs:
    - targets:
      - alertmanager:9093
EOF
)
```

### Remove

```sh
docker rm -f alertmanager
docker volume rm alertmanager-data
```
