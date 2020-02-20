# Pachyderm

## Helm

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- [MinIO](/minio.md)

### Install

```sh
kubectl create namespace pachyderm
```

```sh
helm install stable/pachyderm \
  -n pachyderm \
  --namespace pachyderm \
  --set etcd.persistence.enabled=true \
  --set etcd.persistence.accessMode=ReadWriteMany \
  --set credentials=s3 \
  --set s3.accessKey='AKIAIOSFODNN7EXAMPLE' \
  --set s3.secretKey='wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY' \
  --set s3.bucketName=pachyderm \
  --set s3.endpoint=minio.example.com
```

```sh
kubectl rollout status deploy/pachd -n pachyderm
```

### Delete

```sh
helm delete pachyderm --purge
kubectl delete namespace pachyderm --grace-period=0 --force
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
