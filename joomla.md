# Joomla!

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
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=joomla \
  -e MYSQL_PASSWORD=joomla \
  -e MYSQL_DATABASE=joomla \
  -v joomla-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name joomla-mysql \
  --network workbench \
  docker.io/library/mysql:5.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h joomla \
  -e JOOMLA_DB_HOST='joomla-mysql' \
  -e JOOMLA_DB_USER='joomla' \
  -e JOOMLA_DB_PASSWORD='joomla' \
  -e JOOMLA_DB_NAME='joomla' \
  -v joomla-data:/var/www/html \
  -p 9000:9000 \
  --name joomla \
  --network workbench \
  docker.io/library/joomla:3.9-fpm-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v joomla-nginx-conf:/etc/nginx/conf.d \
  -v joomla-data:/var/www/html \
  -p 8080:80 \
  --name joomla-nginx \
  --network workbench \
  docker.io/library/nginx:1.17-alpine
```

```sh
docker exec -i joomla-nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/joomla.conf
upstream joomla {
    server joomla:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass joomla;
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
docker restart joomla-nginx
```

```sh
# Health check
curl -i 'http://127.0.0.1:8080/health-check'

# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f joomla-mysql joomla joomla-nginx
docker volume rm joomla-mysql-data joomla-data joomla-nginx-conf
```
