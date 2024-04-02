# HyperSwitch App Server

## Links

- [Docs](https://docs.hyperswitch.io/hyperswitch-open-source/local-setup/run-app-server)

## Docker Compose

```sh
#
git clone https://github.com/juspay/hyperswitch hyperswitch && cd "$_

#
docker compose up -d

#
curl --head --request GET 'http://localhost:8080/health'
```
