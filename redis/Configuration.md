# Configuration

```sh
sudo adduser -Mrs /bin/false redis
```

```sh
sudo install -dm 775 -o redis -g redis /var/lib/redis
```

```sh
sudo sed -ie '/^supervised/s/no/systemd/g' /usr/local/redis/conf/redis.conf
sudo sed -i 's|^dir .*|dir /var/lib/redis|' /usr/local/redis/conf/redis.conf
```
