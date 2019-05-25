# Docker

## Volume

```sh
docker volume create nginx-conf
```

## Running

```sh
docker run -d \
  -h nginx \
  -v nginx-conf:/etc/nginx/conf.d \
  -v /etc/localtime:/etc/localtime:ro \
  -p 80:80 \
  --name nginx \
  --restart always \
  nginx:1.15.8-alpine
```

## Config

```sh
docker exec -i nginx /bin/sh << 'EOSHELL'
cat << 'EOF' > /etc/nginx/conf.d/default.conf
server {

}
EOF
EOSHELL
```

```sh
docker restart nginx
```

## Remove

```sh
docker rm -f nginx
docker volume rm nginx-conf
```
