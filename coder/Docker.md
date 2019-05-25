# Docker

## Volume

```sh
docker volume create coder-project
```

## Running

```sh
docker run -d \
  -h coder \
  -v coder-project:/home/coder/project \
  -p 8443:8443 \
  --name coder \
  --restart always \
  codercom/code-server:1.939 --allow-http --no-auth
```

## Remove

```sh
docker rm -f coder
docker volume rm coder-project
```
