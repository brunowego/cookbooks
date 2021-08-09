# Dremio OSS

<!--
https://github.com/dremio/dremio-cloud-tools/tree/master/charts/dremio_v2

https://github.com/xiaset/docker-dremio-oss-hdfs/blob/master/Dockerfile
https://github.com/markfjohnson/RangerDremio
https://github.com/VadymKhodak/dremio_presentation
https://github.com/theundertakerjr666/apache_dremio_node_d3js_docker
https://github.com/nadeemnazeer3/RedashDremio
https://github.com/rymurr/dremio-prometheus-exporter
https://github.com/bbonnin/zeppelin-dremio-tests
https://github.com/markfjohnson/Dremio_Master_Detail_Parquet
https://github.com/josepcurto/mbd-bidw
-->

## Helm

### References

- [Values](https://github.com/dremio/dremio-cloud-tools/blob/master/charts/dremio_v2/values.yaml)

### Repository

```sh
curl -L 'https://github.com/dremio/dremio-cloud-tools/archive/master.tar.gz' | \
  tar -xz --strip-components 1 dremio-cloud-tools-master/charts
```

### Install

```sh
kubectl create namespace dremio
```

```sh
helm install dremio-oss ./charts/dremio_v2 \
  --namespace dremio \
  --version 2.0.0 \
  -f <(cat << EOF
coordinator:
  cpu: 2
  memory: 4096
  count: 1
  volumeSize: 10Gi

executor:
  cpu: 2
  memory: 4096
  count: 1
  volumeSize: 10Gi
EOF
)
```

```sh
#
export INGRESS_HOST='127.0.0.1'

#
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: dremio-ui
  namespace: dremio
spec:
  rules:
  - host: dremio.${INGRESS_HOST}.nip.io
    http:
      paths:
      - backend:
          serviceName: dremio-client
          servicePort: 9047
        path: /
EOF
```

```sh
rm -fR ./charts
```

### Status

```sh
kubectl rollout status statefulset/dremio-coordinator \
  -n dremio
```

### Logs

```sh
kubectl logs \
  -l 'app=dremio-coordinator' \
  -n dremio \
  -f
```

### Delete

```sh
helm uninstall dremio-oss \
  -n dremio

kubectl delete namespace dremio \
  --grace-period=0 \
  --force
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
  -h dremio-oss \
  -v dremio-oss-conf:/opt/dremio/conf \
  -v dremio-oss-data:/var/lib/dremio \
  -p 9047:9047 \
  -p 31010:31010 \
  -p 45678:45678 \
  --name dremio-oss \
  --network workbench \
  docker.io/dremio/dremio-oss:4.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9047'
```

### Remove

```sh
docker rm -f dremio-oss

docker volume rm \
  dremio-oss-conf \
  dremio-oss-data
```
