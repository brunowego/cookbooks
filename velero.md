# Velero

<!--
https://www.youtube.com/watch?v=C9hzrexaIDA
https://kaichu.io/posts/velero-research-practice/
-->

## Links

- [Code Repository](https://github.com/vmware-tanzu/velero)
- [Main Website](https://velero.io)

## Helm

### References

- [Installing](https://github.com/vmware-tanzu/helm-charts/tree/main/charts/velero#installing)

### Dependencies

- [MinIO](/minio.md)
- [AWS S3 Tools (S3cmd)](/s3cmd.md)

### Repository

```sh
helm repo add vmware-tanzu 'https://vmware-tanzu.github.io/helm-charts'
helm repo update
```

### Bucket Creation

```sh
#
cat << EOF > ~/.s3cfg
[default]
host_base = minio.${DOMAIN}
host_bucket = minio.${DOMAIN}
use_https = False

access_key = minio
secret_key = minio123
EOF

#
s3cmd mb s3://velero
```

### Install

```sh
#
kubectl create ns velero

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install velero vmware-tanzu/velero \
  --namespace velero \
  --version 2.23.3 \
  -f <(cat << EOF
configuration:
  provider: aws
  backupStorageLocation:
    bucket: velero
    config:
      region: default
      s3ForcePathStyle: true
      publicUrl: http://minio.${DOMAIN}
      s3Url: http://minio.minio.svc.cluster.local:9000
  volumeSnapshotLocation:
    config:
      region: default

credentials:
  useSecret: true
  secretContents:
    cloud: |
      [default]
      aws_access_key_id = minio
      aws_secret_access_key = minio123

configMaps:
  restic-restore-action-config:
    labels:
      velero.io/plugin-config: ''
      velero.io/restic: RestoreItemAction
    data:
      image: docker.io/velero/velero-restic-restore-helper:v1.6.0

deployRestic: true

restic:
  # resources:
  #   requests:
  #     cpu: 250m
  #     memory: 256Mi
  #   limits:
  #     cpu: 350m
  #     memory: 512Mi

# resources:
#   requests:
#     cpu: 250m
#     memory: 128Mi
#   limits:
#     cpu: 350m
#     memory: 512Mi

initContainers:
- name: velero-plugin-for-aws
  image: docker.io/velero/velero-plugin-for-aws:v1.1.0
  imagePullPolicy: IfNotPresent
  volumeMounts:
  - mountPath: /target
    name: plugins
EOF
)
```

### Status

```sh
kubectl rollout status deploy/velero \
  -n velero
```

### Logs

```sh
kubectl logs \
  -l 'name=velero' \
  -n velero \
  -f
```

### Demonstration

#### Dependencies

- [Rocket.chat](/rocket.chat.md#helm)

#### Annotation

```sh
#
kubectl get pod \
  -l 'app.kubernetes.io/name=mongodb' \
  -o jsonpath='{.items[0].spec.volumes}' \
  -n rocketchat

#
kubectl annotate pod \
  -l 'app.kubernetes.io/name=mongodb' \
  -n rocketchat \
  backup.velero.io/backup-volumes=datadir
```

#### Backup

##### Create

```sh
#
velero backup create rocketchat-backup \
  --include-namespaces rocketchat

#
velero backup get rocketchat-backup

#
kubectl get backups.velero.io \
  -n velero

#
velero backup describe rocketchat-backup \
  --details

#
velero backup logs rocketchat-backup
```

##### Transfer

```sh
#
mkdir ./rocketchat-backup

#
s3cmd \
  -p sync \
  s3://velero/ \
  ./rocketchat-backup/

#
ls ./rocketchat-backup
```

##### Restore

```sh
#
s3cmd \
  -p sync ./rocketchat-backup/ \
  s3://velero/

#
velero restore create \
  --from-backup rocketchat-backup
```

##### Delete

```sh
rm -fR ./rocketchat-backup
```

### Delete

```sh
helm uninstall velero \
  -n velero

kubectl delete ns velero \
  --grace-period=0 \
  --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install velero
```

#### Linux Binary

```sh
curl \
  -L \
  'https://github.com/vmware-tanzu/velero/releases/download/v1.6.1/velero-v1.6.1-linux-amd64.tar.gz' | \
    tar -xzC /usr/local/bin --transform s/-v1.6.1-linux-amd64//
```

#### Chocolatey

```sh
choco install velero
```

### Commands

```sh
velero -h
```

### Configuration

```sh
#
velero client config set namespace=[namespace]

#
velero client config set features=EnableCSI

#
cat ~/.config/velero/config.json
```

### Usage

#### Schedule

```sh
#
velero schedule create hourly \
  --schedule '@every 1h' \
  --ttl 24h0m0s

#
velero schedule describe hourly
```

#### Backup

```sh
#
velero backup create [backup-name] \
  --include-namespaces [namespace] \
  --storage-location aws

#
velero backup get
velero backup get [backup-name]

#
kubectl get backups.velero.io \
  -n velero

#
velero backup describe [backup-name] \
  --details

#
velero backup logs [backup-name]
```

```sh
#
velero backup-location create secondary \
  --provider aws \
  --bucket [secondary-bucket-name] \
  --region [region-name]
```

#### Restore

```sh
#
velero restore create \
  --from-backup [before-test-1] \
  --include-namespaces [namespace]
```
