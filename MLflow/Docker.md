# Docker

## Volume

```sh
docker volume create example-minio-data
```

## Build

```sh
cat << EOF | docker build -t example/mlflow -
FROM python:3.7

RUN pip install --no-cache-dir mlflow==0.9.1

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/mlflow"]

EOF
```

## Running

```sh
docker run -d \
  -h minio.example.local \
  -e MINIO_ACCESS_KEY='AKIAIOSFODNN7EXAMPLE' \
  -e MINIO_SECRET_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -v example-minio-data:/data \
  -p 9000:9000 \
  --name example-minio \
  --restart always \
  minio/minio:RELEASE.2019-05-23T00-29-34Z server /data
```

```sh
docker run -d \
  -h mlflow.example.local \
  -e MLFLOW_S3_ENDPOINT_URL='http://example-minio:9000' \
  -e AWS_ACCESS_KEY_ID='AKIAIOSFODNN7EXAMPLE' \
  -e AWS_SECRET_ACCESS_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -p 5000:5000 \
  --name example-mlflow \
  --restart always \
  --link example-minio \
  example/mlflow:latest server --backend-store-uri /tmp/mlflow --default-artifact-root s3://mlflow/artifacts -h 0.0.0.0
```

## Remove

```sh
docker rm -f example-minio example-mlflow
docker volume rm example-minio-data
```