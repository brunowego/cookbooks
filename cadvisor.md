# cAdvisor

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h cadvisor \
  -v /:/rootfs:ro \
  -v /var/run:/var/run:ro \
  -v /sys:/sys:ro \
  -v /var/lib/docker/:/var/lib/docker:ro \
  -v /dev/disk/:/dev/disk:ro \
  -p 8080:8080 \
  --name cadvisor \
  docker.io/google/cadvisor:v0.33.0
```

```sh
xdg-open 'http://127.0.0.1:8080' || open 'http://127.0.0.1:8080' || echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f cadvisor
```
