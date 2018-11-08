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
  --restart always \
  minio/minio:latest server /data
```

```sh
docker logs minio
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):9000"
```
