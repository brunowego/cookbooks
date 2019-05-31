# Docker

## Image

```Dockerfile
FROM alpine:3.9

RUN apk add --no-cache supervisor

COPY ./supervisord.conf /etc
COPY ./[name].ini /etc/supervisor.d/

EXPOSE 9001

CMD ["supervisord", "-nc", "/etc/supervisord.conf"]
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):9001"
```
