# Elsa Workflows

## Links

- [Code Repository](https://github.com/elsa-workflows/elsa-core)
- [Main Website](https://v2.elsaworkflows.io)

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
  -h elsaworkflows \
  -e ELSA__SERVER__BASEURL='http://localhost:13000' \
  -e ASPNETCORE_ENVIRONMENT='Development' \
  -p 13000:80 \
  --name elsaworkflows \
  --network workbench \
  docker.io/elsaworkflows/elsa-dashboard-and-server:latest
```

### Remove

```sh
docker rm -f elsaworkflows
```
