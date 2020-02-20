# NSQ

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nsq-lookupd \
  -p 4160:4160 \
  -p 4161:4161 \
  --name nsq-lookupd \
  docker.io/nsqio/nsq:v1.2.0 /nsqlookupd
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nsqd \
  -v nsq-data:/data \
  -p 4150:4150 \
  -p 4151:4151 \
  --name nsqd \
  docker.io/nsqio/nsq:v1.2.0 /nsqd \
    --lookupd-tcp-address='nsq-lookupd:4160' \
    --broadcast-address='host.docker.internal' \
    --data-path='/data'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nsq-admin \
  -p 4171:4171 \
  --name nsq-admin \
  docker.io/nsqio/nsq:v1.2.0 /nsqadmin \
    --lookupd-http-address='nsq-lookupd:4161'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:4171'
```

### Remove

```sh
docker rm -f nsq-lookupd nsq-admin nsqd
docker volume rm nsq-data
```
