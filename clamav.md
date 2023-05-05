# ClamAV

## Links

- [Code Repository](https://github.com/Cisco-Talos/clamav)
- [Main Website](https://clamav.net)
- [Docs](https://docs.clamav.net)

## Related

- [Clamscan](/clamscan.md)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h clamav \
  -p 3310:3310 \
  -p 7357:7357 \
  --name clamav \
  --network workbench \
  docker.io/clamav/clamav:1.1
```

### Remove

```sh
docker rm -f clamav
```

<!--
https://github.com/truecharts/charts/tree/master/charts/stable/clamav
-->
