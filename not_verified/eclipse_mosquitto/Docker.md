# Docker

## Volume

```sh
docker volume create mosquitto-config
docker volume create mosquitto-data
docker volume create mosquitto-log
```

## Running

```sh
docker run -d \
  -h mosquitto \
  -v mosquitto-config:/mosquitto/config \
  -v mosquitto-data:/mosquitto/data \
  -v mosquitto-log:/mosquitto/log \
  -p 1883:1883 \
  -p 9001:9001 \
  --name mosquitto \
  eclipse-mosquitto:1.6.2
```

```sh
docker exec -i mosquitto /bin/sh << EOSHELL
cat << EOF > /mosquitto/config/mosquitto.conf
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log

EOF
EOSHELL
```

```sh
docker restart mosquitto
```

## Remove

```sh
docker rm -f mosquitto
docker volume rm mosquitto-config mosquitto-data mosquitto-log
```
