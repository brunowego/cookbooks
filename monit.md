# Monit

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
  -h monit \
  -v "$HOME"/.monitrc:/etc/monitrc \
  -p 2812:2812 \
  --name monit \
  --network workbench \
  docker.io/kijart/monit:1.3.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:2812'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `monit`  |

### Remove

```sh
docker rm -f monit
```

## CLI

### Installation

#### Homebrew

```sh
brew install monit
```

#### APT

```sh
sudo apt update
sudo apt -y install monit
```

### Configuration

```sh
# Homebrew
cp "$(brew --prefix monit)"/.bottle/etc/monitrc ~/.monitrc
```

### Service

```sh
# Homebrew
brew services start monit

# Or, using CLI
monit -I -c ~/.monitrc
```

```sh
echo -e '[INFO]\thttp://localhost:2812'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `monit`  |
