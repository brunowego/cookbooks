# code-server

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h coder \
  -v coder-project:/home/coder/project \
  -p 8443:8443 \
  --name coder \
  codercom/code-server:1.939 --allow-http --no-auth
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8443'
```

### Remove

```sh
docker rm -f coder
docker volume rm coder-project
```
