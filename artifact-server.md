# Artifact Server

## Links

- [Code Repository](https://github.com/anthonykawa/artifact-server)

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
  -h artifact-server \
  -e AUTH_KEY='foo' \
  -p 8080:8080 \
  --name artifact-server \
  --network workbench \
  ghcr.io/jefuller/artifact-server:latest
```

### Configuration

```sh
tee -a ~/.actrc << EOF

--env ACTIONS_CACHE_URL=http://localhost:8080/
--env ACTIONS_RUNTIME_URL=http://localhost:8080/
--env ACTIONS_RUNTIME_TOKEN=foo
EOF
```

### Remove

```sh
docker rm -f artifact-server
```
