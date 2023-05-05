# MinIO Client (mc)

## CLI

### Installation

#### Homebrew

```sh
brew install minio-mc
```

### Commands

```sh
mc -h
```

### Usage

```sh
# Config
mc config host add [alias] [url] [accesskey] [secretkey]

# List
mc ls [repo]/[bucket]

# Remove
mc rm -r --force [repo]/[bucket]

# Make Bucket
mc mb [repo]/[bucket]

# Policy
mc policy [public|upload|download|list] [repo]/[bucket]
```

<!--
mc --insecure alias set minio https://${MINIO_SERVICE_HOST}:${MINIO_SERVICE_PORT_HTTP_MINIO} "${MINIO_ROOT_USER}" "${MINIO_ROOT_PASSWORD}"

mc --insecure cp report-${HOSTNAME}.html minio/artillery
-->

## Kubectl

### Running

```sh
kubectl run -it --rm \
  minio-mc \
  --image docker.io/minio/mc:RELEASE.2019-05-23T01-33-27Z \
  --restart 'Never' \
  -- -h
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -i --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  --network workbench \
  docker.io/minio/mc:RELEASE.2019-05-23T01-33-27Z -h
```
