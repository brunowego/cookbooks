# Matomo Queued Tracking

## Dependencies

```sh
docker run -d \
  -h redis \
  -e REDIS_PASSWORD=redis \
  -v redis-data:/data \
  -p 6379:6379 \
  --name redis \
  docker.io/library/redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
```

## Installation

```sh
cd /path/to/matomo
```

```sh
curl -L https://github.com/matomo-org/plugin-QueuedTracking/archive/3.3.5.tar.gz | \
  tar -xzC ./plugins --transform s/plugin-QueuedTracking-3.3.5/QueuedTracking/
```

## Activate

```sh
./console plugin:activate QueuedTracking
```

## Configuration

```sh
./console config:set \
  'QueuedTracking.redisHost="127.0.0.1"' \
  'QueuedTracking.redisPort=6379' \
  'QueuedTracking.redisPassword="redis"' \
  'QueuedTracking.redisDatabase=0'
```

## Test

```sh
./console visitorgenerator:generate-visits \
  --idsite 1 \
  --days 7 \
  --custom-piwik-url http://127.0.0.1
```
