# InfluxDB

## Links

- [Code Repository](https://github.com/influxdata/influxdb)
- [Main Website](https://influxdata.com)

## CLI

### Installation

#### Homebrew

```sh
brew install influxdb
```

### Commands

```sh
influx -h
```

## Docker Compose

### Manifest

```yml
---
version: '3'

services:
  influxdb:
    image: docker.io/library/influxdb:1.8.10-alpine
    container_name: boilerplate-influxdb
    volumes:
      - type: volume
        source: influxdb-data
        target: /var/lib/influxdb
    environment:
      INFLUXDB_DB: dev
      INFLUXDB_HTTP_MAX_BODY_SIZE: 0
    ports:
      - target: 8086
        published: $INFLUXDB_PORT
        protocol: tcp
    restart: unless-stopped

volumes:
  influxdb-data:
    driver: local
```
