# AWS S3 Output

## Links

- [Docs](https://banzaicloud.com/docs/one-eye/logging-operator/plugins/outputs/s3/)

## Dependencies

- Create [MinIO](/minio/README.md#helm) in the `logging` namespace.

## Installation

```sh
#
cat << \EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Output
metadata:
  name: s3-output
spec:
  s3:
    aws_key_id:
      valueFrom:
        secretKeyRef:
          key: access-key
          name: minio
    aws_sec_key:
      valueFrom:
        secretKeyRef:
          key: secret-key
          name: minio
    buffer:
      timekey: 1m
      timekey_use_utc: true
      timekey_wait: 30s
    force_path_style: 'true'
    path: logs/${tag}/%Y/%m/%d/
    s3_bucket: demo
    s3_endpoint: http://minio:9000
    s3_region: eu-east-1
EOF

#
kubectl get output \
  -n logging

#
cat << \EOF | kubectl apply \
  -n logging \
  -f -
apiVersion: logging.banzaicloud.io/v1beta1
kind: Flow
metadata:
  name: s3-flow
spec:
  localOutputRefs:
  - s3-output
  filters:
  - tag_normaliser:
      format: ${namespace_name}.${pod_name}.${container_name}
  - parser:
      remove_key_name_field: true
      reserve_data: true
      parse:
        type: nginx
        # type: json
  match:
  - select: {}
EOF

#
kubectl get flow \
  -n logging
```

## Validation

```sh
echo -e "[INFO]\thttp://minio.${INGRESS_HOST}.nip.io/minio/demo/"
```

## Delete

```sh
#
kubectl delete flow s3-flow \
  -n logging

#
kubectl delete output s3-output \
  -n logging
```
