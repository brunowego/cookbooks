# Pi-hole

<!--
https://www.youtube.com/watch?v=UpoYUudxZU0
https://github.com/henningstorck/home-server/blob/6213a608730229f435ef0c1389d8fb3b700ebda0/docker-compose.yml
-->

**Keywords:** AdBlock

## Links

- [Code Repository](https://github.com/pi-hole/pi-hole)
- [Main Website](https://pi-hole.net)

## Docker

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h pihole \
  -v pihole-config:/etc/pihole \
  -v pihole-dnsmasq-config:/etc/dnsmasq.d \
  -e TZ='America/Sao_Paulo' \
  -e WEBPASSWORD='Pa$$w0rd!' \
  -p 53:53/tcp \
  -p 53:53/udp \
  -p 67:67/udp \
  -p 8080:80/tcp \
  --cap-add NET_ADMIN \
  --name pihole \
  docker.io/pihole/pihole:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/admin/login.php'
```

### Configuration

**macOS:**

```sh
# List hardwares
networksetup -listallhardwareports
# Set Pi-hole DNS
networksetup -setdnsservers Wi-Fi 127.0.0.1
# Set Google DNS
networksetup -setdnsservers Wi-Fi 8.8.8.8 8.8.4.4
```

### Remove

```sh
docker rm -f pihole

docker volume rm pihole-config pihole-dnsmasq-config
```
