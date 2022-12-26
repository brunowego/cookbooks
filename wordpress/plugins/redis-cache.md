# WordPress Redis Object Cache

## Installation

```sh
wp plugin install redis-cache --activate
```

## Docker

### References

- [Connection Parameters](https://github.com/rhubarbgroup/redis-cache/wiki/Connection-Parameters)

### Running

Run [WordPress Docker](/wordpress.md#docker)

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -v wordpress-redis-data:/data \
  -p 6379:6379 \
  --name wordpress-redis \
  --network workbench \
  docker.io/library/redis:5.0.5-alpine3.9
```

<!-- ```sh
export WP_REDIS_HOST='wordpress-redis'
``` -->

<!-- ##

1. Settings
2. Redis
3. -->
