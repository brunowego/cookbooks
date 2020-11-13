# ORY Hydra

<!--
https://www.youtube.com/watch?v=996OiexHze0&feature=emb_title
https://medium.com/@eileen.code4fun/use-the-source-ory-hydra-bd5c460a2f37
-->

## References

- [5 Minute Tutorial](https://www.ory.sh/hydra/docs/5min-tutorial/)

## Tools

- [OpenID Connect <debugger/>](https://oidcdebugger.com/)
- [JSON Web Token - Encode or Decode JWTs](https://jsonwebtoken.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install ory-hydra
```

#### Linux

```sh
bash <(curl https://raw.githubusercontent.com/ory/hydra/master/install.sh) -b ./ 1.4.8
sudo mv ./hydra /usr/local/bin
```

### Commands

```sh
hydra -h
```

### Usage

```sh
#
hydra serve all \
  --config ./config.yaml

#
hydra clients list \
  --endpoint [endpoint] \
  --skip-tls-verify
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  --name hydra \
  docker.io/oryd/hydra:v1.8.5 help
```
