# Hoppscotch

<!--
https://artifacthub.io/packages/helm/deliveryhero/hoppscotch
-->

**Keywords:** GraphQL, API Platform

## Links

- [Code Repository](https://github.com/hoppscotch/hoppscotch)
- [Main Website](https://hoppscotch.io)
- Browser Extension
  - [Google Chrome](https://chrome.google.com/webstore/detail/hoppscotch-browser-extens/amknoiejhlmhancpahfcfcfhllgkpbld?hl=en)
  - [Mozilla Firefox](https://addons.mozilla.org/en-US/firefox/addon/hoppscotch/)

## App

### Installation

```sh
# Using Homebrew
brew install --cask hoppscotch
```

### Commands

```sh
hopp -h
```

### Usage

<!--
echo '[]' > ./hoppscotch_collection.json
-->

```sh
hopp test ./hoppscotch_collection.json
```

## CLI

### Installation

```sh
# Using npm
npm install @hoppscotch/cli -g
```

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
  -h hoppscotch \
  -p 3000:3000 \
  --name hoppscotch \
  --network workbench \
  docker.io/hoppscotch/hoppscotch:v3.0.1
```

<!--
TZ=UTC
-->

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f hoppscotch
```

## Tips

### Developers

- Users
  - [Delete a user](https://getoutline.com/developers#tag/Users/paths/~1users.delete/post)
