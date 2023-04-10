# diagrams.net (p.k.a. draw.io)

<!--
Extension .drawio

filename:.drawio.png
-->

**Keywords:** Diagram as Code

## Links

- [Main Website](https://diagrams.net)

## App

### Installation

#### Homebrew

```sh
brew install --cask drawio
```

### Structure

```sh
#
mkdir -p ./.drawio/exported

#
touch ./.drawio/app.drawio
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension hediet.vscode-drawio

#
jq '."recommendations" += ["hediet.vscode-drawio"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

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
  -h drawio \
  -p 8080:8080 \
  -p 8443:8443 \
  --name drawio \
  --network workbench \
  docker.io/jgraph/drawio:12.3.3-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f drawio
```
