# MinIO

<!--
helm3 install minio --namespace minio --create-namespace minio/minio-operator --version 4.1.0 -f kubernetes/manifests/minio-operator-values.yaml

https://github.com/jsa4000/Observable-Distributed-System/blob/7601330d7cba1532857b9933c7e673f311a50e44/kubernetes/manifests/minio-create-buckets.yaml
-->

## Links

- [Main Website](https://min.io/)

## Alternatives

- [Apache Ozone](https://github.com/apache/ozone)

## References

- [S3cmd with MinIO Server](https://docs.min.io/docs/s3cmd-with-minio)

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/master/bitnami/minio#parameters)

### Dependencies

- [NGINX Ingress](/nginx-ingress.md)
- storage-provisioner or [NFS Client Provisioner](/nfs-client-provisioner.md)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns minio

#
export INGRESS_HOST='127.0.0.1'

#
helm install minio bitnami/minio \
  --namespace minio \
  --version 7.1.3 \
  -f <(cat << EOF
global:
  minio:
    accessKey: minio
    secretKey: minio123

ingress:
  enabled: true
  hostname: minio.${INGRESS_HOST}.nip.io

persistence:
  size: 1G
EOF
)
```

### Status

```sh
kubectl rollout status deploy/minio \
  -n minio
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=minio' \
  -n minio \
  -f
```

### Secrets

```sh
#
kubectl get secret \
  -n minio \
  minio \
  -o jsonpath='{.data.access-key}' | \
    base64 --decode; echo

#
kubectl get secret \
  -n minio \
  minio \
  -o jsonpath='{.data.secret-key}' | \
    base64 --decode; echo
```

### Delete

```sh
helm uninstall minio \
  -n minio

kubectl delete ns minio \
  --grace-period=0 \
  --force
```

## CLI

### Installation

#### Homebrew

```sh
brew tap minio/stable
brew install minio
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
