# Docker

## Running

```sh
docker run -d \
  -h grafana \
  -p 3000:3000 \
  --name grafana \
  --restart always \
  grafana/grafana:5.3.0-beta2
```

GF_PATHS_DATA
GF_PATHS_LOGS
GF_PATHS_PLUGINS

- "GF_SERVER_DOMAIN="
- "GF_SERVER_ROOT_URL="
- "GF_SECURITY_ADMIN_PASSWORD="
- "GF_DATABASE_TYPE=mysql"
- "GF_DATABASE_SSL_MODE=verify-full"
- "GF_DATABASE_NAME=grafana"
- "GF_DATABASE_USER=monitor"
- "GF_DATABASE_HOST=db"
- "GF_DATABASE_PASSWORD="
- "GF_ANALYTICS_REPORTING_ENABLED=false"
- "GF_PATHS_PLUGINS=/plugins"
