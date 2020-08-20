# Oracle WebLogic Server (WLS)

## Docker

Checkout [developer tier](https://hub.docker.com/_/oracle-weblogic-server-12c) before continue.

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h weblogic \
  -p 7001:7001 \
  --name weblogic \
  --network workbench \
  docker.io/store/oracle/weblogic:12.2.1.2
```

<!--
https://github.com/markxnelson/legacy-license-plates/blob/8a05b5ddafc794ab620049807e4900877f007e5f/README.md
-->

> Wait! This process take a while.

```sh
docker logs weblogic | grep 'password'

echo -e '[INFO]\thttp://127.0.0.1:7001/console'
```

### Remove

```sh
docker rm -f weblogic

rm -fR ./properties
```
