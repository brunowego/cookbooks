# ctop

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ctop \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name ctop \
  quay.io/vektorlab/ctop:latest
```

## CLI

### Installation

#### Homebrew

```sh
brew install ctop
```

#### Linux Binary

```sh
sudo curl -L 'https://github.com/bcicen/ctop/releases/download/v0.7.2/ctop-0.7.2-linux-amd64' -o /usr/local/bin/ctop
```

```sh
sudo chmod +x /usr/local/bin/ctop
```

### Commands

```sh
ctop -h
```
