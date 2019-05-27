# Examples

## Server

```sh
mlflow server \
  --backend-store-uri /tmp/mlflow \
  --default-artifact-root s3://[bucket] \
  --host 0.0.0.0
```

## Experiments

```sh
mlflow experiments create [name]
```
