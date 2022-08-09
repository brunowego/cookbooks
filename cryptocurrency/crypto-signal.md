# CryptoSignal

<!--
https://github.com/juliencrn/telegram-rsi-bot/blob/master/index.js
-->

## Links

- [Code Repository](https://github.com/CryptoSignal/Crypto-Signal)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h crypto-signal \
  -v "$PWD"/config.yml:/app/config.yml \
  --name crypto-signal \
  --network workbench \
  docker.io/shadowreaver/crypto-signal:master
```
