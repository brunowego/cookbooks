# Bats (Bash Automated Testing System)

## CLI

### Homebrew

#### Homebrew

```sh
brew install bats-core
```

#### NPM

```sh
npm install bats -g
```

#### Source

##### Install

```sh
wget -O - https://github.com/bats-core/bats-core/archive/v1.1.0.tar.gz | tar -xz
( cd ./bats-core-1.1.0 && ./install.sh /usr/local ) && rm -fR ./bats-core-1.1.0
```

### Tips

#### Visual Studio Code

```sh
code --install-extension jetmartin.bats
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h bats \
  --name bats \
  docker.io/bats/bats:latest -h
```
