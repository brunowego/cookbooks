# NetData

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h netdata \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name netdata \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  --network host \
  docker.io/netdata/netdata:v1.23.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:19999'
```

### Remove

```sh
docker rm -f netdata
```

## CLI

### Installation

#### Homebrew

```sh
brew install netdata
```

### Services

#### Homebrew

```sh
brew services start netdata
```
