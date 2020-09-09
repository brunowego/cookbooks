# Drupal

## Tools

- [Drush](/drush.md)

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
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='drupal' \
  -e MYSQL_PASSWORD='drupal' \
  -e MYSQL_DATABASE='drupal' \
  -v drupal-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name drupal-mysql \
  --network workbench \
  docker.io/library/mysql:5.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h drupal \
  -v drupal-data:/var/www/html \
  -p 9000:9000 \
  --name drupal \
  --network workbench \
  docker.io/library/drupal:9.0-fpm-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v drupal-nginx-conf:/etc/nginx/conf.d \
  -v drupal-data:/var/www/html \
  -p 8080:80 \
  --name drupal-nginx \
  --network workbench \
  docker.io/library/nginx:1.17-alpine
```

```sh
docker exec -i drupal-nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/drupal.conf
upstream drupal {
    server drupal:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass drupal;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location = /health-check {
        access_log off;
        default_type application/json;
        return 200 '{"status": "ok"}';
    }
}

EOF
EOSHELL
```

```sh
docker restart drupal-nginx
```

```sh
# Health check
curl -i 'http://127.0.0.1:8080/health-check'

# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f drupal-mysql drupal drupal-nginx
docker volume rm drupal-mysql-data drupal-data drupal-nginx-conf
```
