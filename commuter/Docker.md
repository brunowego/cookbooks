# Docker

## Volume

```sh
docker volume create commuter-minio-data
```

## Build

```sh
cat << EOF | docker build -t nteract/commuter -
FROM node:10.15.3-alpine

ENV http_proxy=${http_proxy} \
    https_proxy=${https_proxy} \
    no_proxy=${no_proxy}

RUN apk add --no-cache python

WORKDIR /usr/src/commuter

RUN npm init -y && \
    npm i @nteract/commuter@5.8.0

ENV COMMUTER_STORAGE_BACKEND=s3 \
    COMMUTER_BUCKET=examples \
    COMMUTER_S3_KEY='AKIAIOSFODNN7EXAMPLE' \
    COMMUTER_S3_SECRET='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'

EXPOSE 4000

CMD ["commuter"]

EOF
```

## Running

```sh
docker run -d \
  -h minio.commuter.local \
  -e MINIO_ACCESS_KEY='AKIAIOSFODNN7EXAMPLE' \
  -e MINIO_SECRET_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -v commuter-minio-data:/data \
  -p 9000:9000 \
  --name commuter-minio \
  --restart always \
  minio/minio:RELEASE.2019-05-23T00-29-34Z server /data
```

```sh
docker run -i --rm \
  --entrypoint /bin/sh \
  --link commuter-minio \
  minio/mc:RELEASE.2019-05-23T01-33-27Z << EOSHELL
mc config host add local http://commuter-minio:9000 AKIAIOSFODNN7EXAMPLE wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
mc rm -r --force local/examples || true
mc mb local/examples
mc policy download local/examples
EOSHELL
```

## Remove

```sh
docker rm -f commuter-minio
docker volume rm commuter-minio-data
```
