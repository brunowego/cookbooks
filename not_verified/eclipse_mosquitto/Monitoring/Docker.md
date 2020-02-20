# Docker

## Volume

```sh
docker volume create example-influxdb-data
docker volume create example-influxdb-config
docker volume create example-mosquitto-config
docker volume create example-mosquitto-data
docker volume create example-mosquitto-log
docker volume create example-telegraf-config
docker volume create example-mqtt-app
docker volume create example-chronograf-data
```

## Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/mqtt-app -
FROM docker.io/python:3.7-alpine3.9

RUN pip install -q --no-cache paho-mqtt===1.4.0

WORKDIR /usr/src/app

ENTRYPOINT ["python"]

EOF
```

## Running

```sh
docker run -d \
  -h influxdb \
  -v example-influxdb-data:/var/lib/influxdb \
  -v example-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name example-influxdb \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h mosquitto.example-local \
  -v example-mosquitto-config:/mosquitto/config \
  -v example-mosquitto-data:/mosquitto/data \
  -v example-mosquitto-log:/mosquitto/log \
  -p 1883:1883 \
  -p 9001:9001 \
  --name example-mosquitto \
  eclipse-mosquitto:1.6.2
```

```sh
docker exec -i example-mosquitto /bin/sh << EOSHELL
cat << EOF > /mosquitto/config/mosquitto.conf
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log

EOF
EOSHELL
```

```sh
docker restart example-mosquitto
```

```sh
docker run -d \
  -h telegraf \
  -v example-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name example-telegraf \
  telegraf:1.10-alpine
```

```sh
docker exec -i example-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  debug = true

[[inputs.mqtt_consumer]]
  servers = ["tcp://example-mosquitto:1883"]
  qos = 0
  connection_timeout = "30s"
  topics = ["sensors"]
  persistent_session = false
  data_format = "json"
  json_string_fields = ["contact", "my_field"]

[[outputs.influxdb]]
  urls = ["http://example-influxdb:8086"]

EOF
EOSHELL
```

```sh
docker restart example-telegraf
```

```sh
docker run -i --rm \
  -v example-mqtt-app:/usr/src/app \
  alpine:3.9 /bin/sh << EOSHELL
cat << EOF > /usr/src/app/main.py
import json
import pprint
import paho.mqtt.client as mqtt
import time

dict_msg = {
    'contact': True,
    'something': 1.5,
    'temperature': 20.5,
    'my_field': 'awesome',
}
msg = json.dumps(dict_msg)

pprint.pprint(msg)

MQTT_HOST = 'example-mosquitto'
MQTT_PORT = 1883
MQTT_KEEPALIVE_INTERVAL = 45

count = 0

def on_publish(client, userdata, mid):
    print('Message Published to MQTT...')

mqttc = mqtt.Client()
mqttc.on_publish = on_publish
mqttc.connect(MQTT_HOST, MQTT_PORT, MQTT_KEEPALIVE_INTERVAL)

mqttc.publish('sensors', msg)

mqttc.disconnect()
time.sleep(2)

EOF
EOSHELL
```

```sh
docker run -d \
  -h mqtt-app \
  -v example-mqtt-app:/usr/src/app \
  --name example-mqtt-app \
  example/mqtt-app:latest main.py
```

```sh
docker run -d \
  -h chronograf \
  -v example-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name example-chronograf \
  chronograf:1.7-alpine --influxdb-url=http://example-influxdb:8086
```

## Remove

```sh
docker rm -f example-influxdb example-mosquitto example-telegraf example-mqtt-app example-chronograf
docker volume rm example-influxdb-data example-influxdb-config example-mosquitto-config example-mosquitto-data example-mosquitto-log example-telegraf-config example-mqtt-app example-chronograf-data
```
