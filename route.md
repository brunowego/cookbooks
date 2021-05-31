# route

## CLI

### Usage

```sh
# Flush
sudo route -n flush

# Delete
sudo route -n delete [ip]
```

### Tips

#### IP from Default Gateway

```sh
# Linux
route | awk '/^default/ { print $2 }'
```

<!--
docker run --add-host="localhost:192.168.65.1"

docker run -it --rm alpine nslookup host.docker.internal
-->
