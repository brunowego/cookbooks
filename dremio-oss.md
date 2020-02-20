# Dremio OSS

https://github.com/xiaset/docker-dremio-oss-hdfs/blob/master/Dockerfile
https://github.com/markfjohnson/RangerDremio
https://github.com/VadymKhodak/dremio_presentation
https://github.com/theundertakerjr666/apache_dremio_node_d3js_docker
https://github.com/nadeemnazeer3/RedashDremio
https://github.com/rymurr/dremio-prometheus-exporter
https://github.com/bbonnin/zeppelin-dremio-tests
https://github.com/markfjohnson/Dremio_Master_Detail_Parquet
https://github.com/josepcurto/mbd-bidw

## References

- [Documentation](https://docs.dremio.com/)
- [Data Warehouses Explained by Dremio](https://www.dremio.com/what-is-a-data-warehouse/)

## Helm

### Install

```sh
curl -L 'https://github.com/dremio/dremio-cloud-tools/archive/master.tar.gz' | \
  tar -xz --strip-components 1 dremio-cloud-tools-master/charts
```

```sh
kubectl create namespace dremio
```

```sh
helm install ./charts/dremio \
  -n dremio-oss \
  --namespace dremio \
  --set coordinator.memory=1024 \
  --set coordinator.cpu=1 \
  --set coordinator.count=1 \
  --set coordinator.volumeSize=10Gi \
  --set executor.memory=1024 \
  --set executor.cpu=1 \
  --set executor.count=1 \
  --set executor.volumeSize=10Gi \
  --set zookeeper.memory=512 \
  --set zookeeper.cpu=0.2 \
  --set zookeeper.count=1 \
  --set zookeeper.volumeSize=1Gi \
  --set serviceType=ClusterIP
```

```sh
cat << EOF | kubectl apply -f -
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: dremio-ui
  namespace: dremio
spec:
  rules:
    - host: dremio.$(minikube ip).nip.io
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

### Delete

```sh
helm delete dremio-oss --purge
kubectl delete namespace dremio --grace-period=0 --force
```

## Docker

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
  docker.io/dremio/dremio-oss:4.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9047'
```

### Remove

```sh
docker rm -f dremio-oss
docker volume rm dremio-oss-conf dremio-oss-data
```
