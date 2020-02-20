# Adminer

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
  -h adminer \
  -v adminer-data:/var/www/html \
  -p 9000:9000 \
  --name adminer \
  docker.io/library/adminer:4.7-fastcgi
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nginx \
  -v adminer-nginx-conf:/etc/nginx/conf.d \
  -v adminer-data:/var/www/html \
  -p 8080:80 \
  --name adminer-nginx \
  docker.io/library/nginx:1.17-alpine
```

```sh
docker exec -i adminer-nginx /bin/sh << \EOSHELL
cat << \EOF > /etc/nginx/conf.d/adminer.conf
upstream adminer {
    server adminer:9000;
}

server {
    listen 80 default_server;
    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        fastcgi_pass adminer;
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
docker restart adminer-nginx
```

```sh
# Health check
curl -i 'http://127.0.0.1:8080/health-check'

# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f adminer adminer-nginx
docker volume rm adminer-data adminer-nginx-conf
```
