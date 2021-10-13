# MinIO Operator

## Helm

### References

- [Chart Repository](https://github.com/minio/operator/tree/master/helm/minio-operator)

### Repository

```sh
helm repo add minio 'https://operator.min.io'
helm repo update
```

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
kubectl create ns minio
```

```sh
helm install minio minio/minio-operator \
  --namespace minio \
  --version 4.1.7 \
  -f <(cat << EOF
console:
  ingress:
    enabled: true
    host: minio.${INGRESS_HOST}.nip.io

tenants: {}
EOF
)
```

### Status

```sh
kubectl rollout status deploy/minio-operator \
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
kubectl get secret $(kubectl get serviceaccount console-sa --namespace minio -o jsonpath="{.secrets[0].name}") \
  --namespace minio \
  -o jsonpath="{.data.token}" | \
    base64 --decode; echo
```

### Ingress

```sh
echo -e "[INFO]\thttp://minio.${INGRESS_HOST}.nip.io"
```

### Deploy Tenant

#### Install

```sh
#
kubectl create ns minio-tenant

#
kubectl apply \
  -n minio-tenant \
  -f <(cat << EOF
apiVersion: v1
kind: Secret
metadata:
  name: minio-creds-secret
type: Opaque
data:
  accesskey: "$(echo -n 'minio' | base64)"
  secretkey: "$(echo -n 'minio123' | base64)"
---
apiVersion: v1
kind: Secret
metadata:
  name: console-secret
type: Opaque
data:
  CONSOLE_PBKDF_PASSPHRASE: "$(echo -n 'SECRET' | base64)"
  CONSOLE_PBKDF_SALT: "$(echo -n 'SECRET' | base64)"
  CONSOLE_ACCESS_KEY: "$(echo -n 'minio' | base64)"
  CONSOLE_SECRET_KEY: "$(echo -n 'minio123' | base64)"
---
apiVersion: minio.min.io/v2
kind: Tenant
metadata:
  name: minio
  labels:
    app: minio
  annotations:
    prometheus.io/path: /minio/prometheus/metrics
    prometheus.io/port: "9000"
    prometheus.io/scrape: "true"
spec:
  image: docker.io/minio/minio:RELEASE.2021-05-27T22-06-31Z
  imagePullPolicy: IfNotPresent
  credsSecret:
    name: minio-creds-secret
  pools:
  - servers: 1
    volumesPerServer: 4
    volumeClaimTemplate:
      metadata:
        name: data
      spec:
        storageClassName: hostpath
        accessModes:
        - ReadWriteOnce
        resources:
          requests:
            storage: 10Gi
    securityContext:
      runAsUser: 1000
      runAsGroup: 1000
      runAsNonRoot: true
      fsGroup: 1000
  mountPath: /export
  requestAutoCert: false
  s3:
    bucketDNS: false
  certConfig:
    commonName: ""
    organizationName: []
    dnsNames: []
  podManagementPolicy: Parallel
  serviceMetadata:
    minioServiceLabels:
      label: minio-svc
    minioServiceAnnotations:
      v2.min.io: minio-svc
    consoleServiceLabels:
      label: console-svc
    consoleServiceAnnotations:
      v2.min.io: console-svc
  console:
    image: docker.io/minio/console:v0.7.4
    replicas: 2
    consoleSecret:
      name: console-secret
    securityContext:
      runAsUser: 1000
      runAsGroup: 2000
      runAsNonRoot: true
      fsGroup: 2000
EOF
)

#
kubectl port-forward svc/minio-console 9090 \
  --namespace minio-tenant
```

<!-- #### Client

```sh
#
mc alias set minio-default http://localhost:9000 minio minio123 --api S3v4

#
kubectl --namespace minio port-forward svc/minio 9000:80

#
mc mb minio-default/mybucket

#
mc ls minio-default
``` -->

#### Delete

```sh
kubectl delete ns minio-tenant
```

### Delete

```sh
helm uninstall minio \
  -n minio

kubectl delete ns minio \
  --grace-period=0 \
  --force
```
