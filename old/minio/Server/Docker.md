# Docker

## Volume

```sh
docker volume create minio-data
```

## Running

```sh
docker run -d \
  -h minio \
  -e MINIO_ACCESS_KEY='AKIAIOSFODNN7EXAMPLE' \
  -e MINIO_SECRET_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -v minio-data:/data \
  -p 9000:9000 \
  --name minio \
  minio/minio:RELEASE.2019-05-23T00-29-34Z server /data
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

## Remove

```sh
docker rm -f minio
docker volume rm minio-data
```
