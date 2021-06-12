# MinIO

## Alternatives

- [Apache Ozone](https://github.com/apache/ozone)

## References

- [S3cmd with MinIO Server](https://docs.min.io/docs/s3cmd-with-minio)

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/minio#configuration)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [Kubernetes TLS Secret](/k8s-tls-secret.md)
- storage-provisioner or [NFS Client Provisioner](/nfs-client-provisioner.md)

### Install

```sh
kubectl create namespace minio
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n minio
```

```sh
helm install minio stable/minio \
  --namespace minio \
  --set ingress.enabled=true \
  --set ingress.hosts={minio.example.com} \
  --set 'ingress.tls[0].secretName=example.tls-secret' \
  --set 'ingress.tls[0].hosts={minio.example.com}' \
  --set accessKey='AKIAIOSFODNN7EXAMPLE' \
  --set secretKey='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY'
```

### Status

```sh
kubectl rollout status deploy/minio -n minio
```

### Delete

```sh
helm uninstall minio -n minio

kubectl delete namespace minio --grace-period=0 --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install minio/stable/minio
```

### Commands

```sh
# Running
minio server /data
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
  -h minio \
  -e MINIO_ACCESS_KEY='AKIAIOSFODNN7EXAMPLE' \
  -e MINIO_SECRET_KEY='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  -v minio-data:/data \
  -p 9000:9000 \
  --name minio \
  --network workbench \
  docker.io/minio/minio:RELEASE.2019-05-23T00-29-34Z server /data
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

### Remove

```sh
docker rm -f minio

docker volume rm minio-data
```
