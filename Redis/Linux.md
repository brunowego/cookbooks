# Linux

## Installation

### Linux

```sh
curl http://download.redis.io/releases/redis-5.0.3.tar.gz | tar -xzC /tmp
( cd /tmp/redis-5.0.3 && make && sudo make install PREFIX=/usr/local/redis )
```

```sh
sudo mkdir -p /usr/local/redis/conf
```

```sh
sudo cp /tmp/redis-5.0.3/redis.conf /usr/local/redis/conf
```

```sh
rm -r /tmp/redis-5.0.3
```
