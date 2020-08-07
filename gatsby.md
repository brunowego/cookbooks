# Gatsby

## References

- [Starters](https://www.gatsbyjs.org/docs/starters/)

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
  -h gatsby \
  -p 8080:80 \
  --name gatsby \
  --network workbench \
  docker.io/gatsbyjs/gatsby:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f gatsby
```

## CLI

### Installation

#### Homebrew

```sh
brew install gatsby-cli
```

#### YARN

```sh
yarn global add gatsby-cli
```

#### NPM

```sh
npm install gatsby-cli -g
```

### Configuration

```sh
# Disable GatsbyJS analytics
gatsby telemetry --disable

# Using Yarn as your Gatsby package manager
jq '.cli.packageManager |= "yarn"' "$HOME/.config/gatsby/config.json" | sponge "$HOME/.config/gatsby/config.json"
```

### Commands

```sh
gatsby -h
```

### Usage

```sh
gatsby new my-default-starter

# or from repo
gatsby new my-default-starter https://github.com/gatsbyjs/gatsby-starter-default
gatsby new my-default-starter https://github.com/gatsbyjs/gatsby-starter-blog
gatsby new my-default-starter https://github.com/gatsbyjs/gatsby-starter-hello-world

cd my-default-starter

gatsby develop
```
