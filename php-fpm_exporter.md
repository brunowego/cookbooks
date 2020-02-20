# PHP-FPM Exporter for Prometheus

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/prometheus-php-fpm-exporter#configuration)

### Dependencies

- [Prometheus](/prometheus.md#helm)
- [PHP-FPM](/php-fpm.md#kubernetes)

### Install

```sh
# helm install stable/prometheus-php-fpm-exporter \
helm install ./ \
  -n prometheus-php-fpm-exporter \
  --namespace php-fpm \
  --set phpFpm.scrapeUri='tcp://php-fpm.php-fpm.svc.cluster.local:9000/status' \
  --set phpFpm.logLevel='debug' \
  --set serviceMonitor.enabled='true' \
  --set serviceMonitor.namespace={monitoring}
```

### Status

```sh
kubectl rollout status deploy/prometheus-php-fpm-exporter -n php-fpm
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=prometheus-php-fpm-exporter' -n php-fpm -f
```

### DNS

```sh
dig @10.96.0.10 prometheus-php-fpm-exporter.php-fpm.svc.cluster.local +short
nslookup prometheus-php-fpm-exporter.php-fpm.svc.cluster.local 10.96.0.10
```

### Delete

```sh
helm delete prometheus-php-fpm-exporter --purge
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h app \
  -p 9000:9000 \
  --name app \
  --network workbench \
  docker.io/library/php:7.3-fpm-alpine
```

```sh
docker exec -i app /bin/sh << EOSHELL
sed -i '/^;pm\.status_path/ s/^;//' /usr/local/etc/php-fpm.d/www.conf
sed -i '/^;ping\.path/ s/^;//' /usr/local/etc/php-fpm.d/www.conf
EOSHELL
```

```sh
docker restart app
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v nginx-conf:/etc/nginx/conf.d \
  -p 8080:80 \
  --name nginx \
  --network workbench \
  docker.io/library/nginx:1.17.5-alpine
```

```sh
docker exec -i nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/php-fpm.conf
upstream php-handler {
    server app:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass php-handler;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location = /health-check {
        access_log off;
        default_type application/json;
        return 200 '{"status": "ok"}';
    }

    location ~ ^/(ping|status)$ {
      fastcgi_pass php-handler;
      fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      include fastcgi_params;
  }
}

EOF
EOSHELL
```

```sh
docker restart nginx
```

```sh
# Health check
curl -i 'http://127.0.0.1:8080/health-check'

#
curl -i 'http://127.0.0.1:8080/ping'
curl -i 'http://127.0.0.1:8080/status'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h php-fpm \
  -e PHP_FPM_WEB_LISTEN_ADDRESS=':9253' \
  -e PHP_FPM_WEB_TELEMETRY_PATH='/metrics' \
  -e PHP_FPM_SCRAPE_URI='tcp://app:9000/status' \
  -e PHP_FPM_FIX_PROCESS_COUNT='false' \
  -e PHP_FPM_LOG_LEVEL='debug' \
  -p 9253:9253 \
  --name php-fpm \
  --network workbench \
  docker.io/hipages/php-fpm_exporter:1.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9253/metrics'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h prometheus \
  -v prometheus-data:/prometheus \
  -p 9090:9090 \
  --name prometheus \
  --network workbench \
  docker.io/prom/prometheus:v2.15.2
```

```sh
docker exec -i prometheus /bin/sh << EOSHELL
cat << EOF > /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
- job_name: prometheus
  static_configs:
  - targets:
    - localhost:9090
- job_name: php-fpm
  static_configs:
  - targets:
    - php-fpm:9253

EOF
EOSHELL
```

```sh
docker restart prometheus
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9090'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h grafana \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -e no_proxy="localhost,127.0.0.1,172.18.101.96,prometheus" \
  -p 3000:3000 \
  --name grafana \
  --network workbench \
  docker.io/grafana/grafana:6.6.0
```

```sh
docker exec -iu root grafana /bin/sh << EOSHELL
cat << EOF > /etc/grafana/provisioning/datasources/grafana-datasource.yml
apiVersion: 1

datasources:
- name: Prometheus
  type: prometheus
  access: proxy
  url: http://prometheus:9090
EOF
EOSHELL
```

```sh
docker restart grafana
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

<!--
3901
4912
-->

```sh
#
ab \
  -n 10000 \
  -c 100 \
  http://127.0.0.1:8080/health-check

#
ab \
  -n 10000 \
  -c 100 \
  http://127.0.0.1:8080/ping
```

### Remove

```sh
docker rm -f php-fpm_exporter app nginx
docker volume rm nginx-conf prometheus-data
```

## CLI

### Dependencies

- [Prometheus](/prometheus.md)

### Installation

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/hipages/php-fpm_exporter/releases/download/v1.0.0/php-fpm_exporter_1.0.0_darwin_amd64' \
  -o /usr/local/bin/php-fpm_exporter
```

```sh
chmod +x /usr/local/bin/php-fpm_exporter
```

### Commands

```sh
php-fpm_exporter -h
```

### Configuration

```sh
# Darwin
yq m -ai /usr/local/etc/prometheus.yml <(cat << EOF
scrape_configs:
- job_name: php-fpm
  static_configs:
  - targets:
    - localhost:9253
EOF
)
```

```sh
# Homebrew
brew services restart prometheus
```

### Usage

#### Status

```sh
# PHPBrew
phpbrew fpm start

# Get
php-fpm_exporter get \
  --phpfpm.scrape-uri tcp://127.0.0.1:9000/status

# Server
php-fpm_exporter server \
  --phpfpm.scrape-uri tcp://127.0.0.1:9000/status

echo -e '[INFO]\thttp://127.0.0.1:9253/metrics'
```

- [Grafana - Kubernetes PHP-FPM](https://grafana.com/grafana/dashboards/4912)
