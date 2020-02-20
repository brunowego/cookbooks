# MinIO

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
helm install stable/minio \
  -n minio \
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
helm delete minio --purge
kubectl delete namespace minio --grace-period=0 --force
```
