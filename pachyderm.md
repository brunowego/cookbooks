# Pachyderm

## Helm

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [MinIO](/minio.md)

### Install

```sh
kubectl create ns pachyderm
```

```sh
helm install pachyderm stable/pachyderm \
  --namespace pachyderm \
  --set etcd.persistence.enabled=true \
  --set etcd.persistence.accessMode=ReadWriteMany \
  --set credentials=s3 \
  --set s3.accessKey='minio' \
  --set s3.secretKey='minio123' \
  --set s3.bucketName=pachyderm \
  --set s3.endpoint=minio.xyz.tld
```

```sh
kubectl rollout status deploy/pachd -n pachyderm
```

### Delete

```sh
helm uninstall pachyderm -n pachyderm
kubectl delete ns pachyderm --grace-period=0 --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install pachyderm/tap/pachctl@1.9
```

### Commands

```sh
pachctl help
```
