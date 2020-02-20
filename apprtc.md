# AppRTC

TODO

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h apprtc-server \
  -e PUBLIC_IP=127.0.0.1 \
  -p 3033:3033 \
  -p 3478:3478 \
  -p 3478:3478/udp \
  -p 8080:8080 \
  -p 8089:8089 \
  --name apprtc-server \
  piasy/apprtc-server:v1.6
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f apprtc-server
```
