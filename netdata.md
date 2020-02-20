# NetData

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h netdata \
  -p 19999:19999 \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name netdata \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata:v1.13.0
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
