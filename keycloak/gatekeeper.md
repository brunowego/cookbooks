# Keycloak Gatekeeper

## CLI

### Installation

#### Source

##### Build & Install

```sh
git clone https://github.com/keycloak/keycloak-gatekeeper keycloak-gatekeeper && cd "$_"
```

```sh
# Darwin
GOOS=darwin GOARCH=amd64 go build -o keycloak-gatekeeper-darwin

# Linux
GOOS=linux GOARCH=amd64 go build -o keycloak-gatekeeper-linux

# Windows
GOOS=windows GOARCH=amd64 go build -o keycloak-gatekeeper-windows.exe
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h keycloak-gatekeeper \
  -p 3000:3000 \
  --name keycloak-gatekeeper \
  docker.io/keycloak/keycloak-gatekeeper:7.0.0
```

### Remove

```sh
docker rm -f keycloak-gatekeeper
```
