# Docker

https://github.com/ekholabs/ai-engineering
https://github.com/SeanPLeary/mlflow-minio-h2o-example
https://github.com/flmu/mlflow-tracking-server
https://github.com/jimthompson5802/mlflow_demo

## Volume

```sh
docker volume create example-minio-data
```

## Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/mlflow -
FROM docker.io/python:3.7

RUN pip install -q --no-cache mlflow===0.9.1

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/mlflow"]

EOF
```

## Running

```sh
docker run -d \
  -h minio \
  -e MINIO_ACCESS_KEY='AKIAIOSFODNN7EXAMPLE' \
  -e MINIO_SECRET_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -v example-minio-data:/data \
  -p 9000:9000 \
  --name example-minio \
  minio/minio:RELEASE.2019-05-23T00-29-34Z server /data
```

```sh
docker run -d \
  -h mlflow \
  -e MLFLOW_S3_ENDPOINT_URL='http://example-minio:9000' \
  -e AWS_ACCESS_KEY_ID='AKIAIOSFODNN7EXAMPLE' \
  -e AWS_SECRET_ACCESS_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -p 5000:5000 \
  --name example-mlflow \
  example/mlflow:latest server --backend-store-uri /tmp/mlflow --default-artifact-root s3://mlflow/artifacts -h 0.0.0.0
```

## Remove

```sh
docker rm -f example-minio example-mlflow
docker volume rm example-minio-data
```
