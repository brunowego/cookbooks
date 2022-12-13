# Ghost

## Links

- [Org. Repository](https://github.com/TryGhost)
- [Main Website](https://ghost.org/)

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
  -h ghost \
  -v ghost-content:/var/lib/ghost/content \
  -p 2368:2368 \
  --name ghost \
  --network workbench \
  docker.io/library/ghost:3.18-alpine
```

> Wait! This process take a while.

```sh
#
docker logs -f ghost | \
  sed '/Ghost is running in production.../ q'

#
echo -e '[INFO]\thttp://127.0.0.1:2368'

# Admin
echo -e '[INFO]\thttp://127.0.0.1:2368/ghost'
```

### Remove

```sh
docker rm -f ghost

docker volume rm ghost-content
```

## CLI

### Links

- [Code Repository](https://github.com/TryGhost/Ghost)

### Installation

```sh
# Using NPM
npm install ghost-cli -g

# Using Yarn 1.x
yarn global add ghost-cli
```

### Commands

```sh
ghost help
```

### Bootstrap

```sh
#
mkdir ./<my-app> && cd "$_"

#
echo 'Y' | ghost install local --db=sqlite3

#
ghost doctor
```

### Usage

```sh
#
ghost ls

#
ghost stop <name>

#
ghost uninstall
```
