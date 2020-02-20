# Docker

## Image

```Dockerfile
FROM docker.io/alpine:3.9

RUN apk add -q --no-cache supervisor

COPY ./supervisord.conf /etc
COPY ./[name].ini /etc/supervisor.d/

EXPOSE 9001

CMD ["/usr/bin/supervisord", "-nc", "/etc/supervisord.conf"]
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9001'
```
