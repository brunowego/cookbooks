# OpenAM

<!--
https://www.cnblogs.com/taosiyu/p/12098088.html
https://github.com/timhberry/openam-flask-decorator/blob/master/routes.py
-->

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
  -h openam \
  -v openam-config:/usr/openam/config \
  -p 8080:8080 \
  --name openam \
  --network workbench \
  docker.io/openidentityplatform/openam:14.5.3
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/openam'

#
echo -e '[INFO]\thttp://127.0.0.1:8080/openam/XUI/#login'
```

| Login | Password |
| --- | --- |
| `amAdmin` | `Pa$$w0rd!` |
| `UrlAccessAgent` | `PaSSw0rd!` |

### Remove

```sh
docker rm -f openam

docker volume rm openam-config
```
