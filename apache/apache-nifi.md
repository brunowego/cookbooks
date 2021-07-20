# Apache NiFi

<!--
https://app.pluralsight.com/library/courses/building-deploying-monitoring-apache-nifi-dataflow/table-of-contents
-->

## References

- [NiFiKop](/nifikop.md)

## Helm

### References

- [Configuration](https://github.com/cetic/helm-nifi#configuration)

### Repository

```sh
helm repo add cetic 'https://cetic.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
kubectl create namespace nifi-system
```

```sh
helm install nifi cetic/nifi \
  --namespace nifi-system \
  --version 0.7.8 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - nifi.${INGRESS_HOST}.nip.io
EOF
)
```

### Status

```sh
kubectl rollout status statefulset nifi \
  -n nifi-system
```

### Logs

```sh
kubectl logs \
  -l 'app=nifi' \
  -c server \
  -n nifi-system \
  -f

kubectl logs \
  -l 'app=nifi' \
  -c app-log \
  -n nifi-system \
  -f

kubectl logs \
  -l 'app=nifi' \
  -c bootstrap-log \
  -n nifi-system \
  -f

kubectl logs \
  -l 'app=nifi' \
  -c user-log \
  -n nifi-system \
  -f
```

### DNS

```sh
dig @10.96.0.10 nifi.nifi.svc.cluster.local +short
nslookup nifi.nifi.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "nifi.${INGRESS_HOST}.nip.io" +short
nslookup "nifi.${INGRESS_HOST}.nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret nifi \
  -o jsonpath='{.data.admin-password}' \
  -n nifi-system | \
    base64 --decode; echo
```

### Delete

```sh
helm uninstall nifi \
  -n nifi-system

kubectl delete namespace nifi-system \
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
  -h nifi \
  -v nifi-logs:/opt/nifi/nifi-current/logs \
  -v nifi-provenance-repository:/opt/nifi/nifi-current/provenance_repository \
  -v nifi-state:/opt/nifi/nifi-current/state \
  -v nifi-conf:/opt/nifi/nifi-current/conf \
  -v nifi-content-repository:/opt/nifi/nifi-current/content_repository \
  -v nifi-database-repository:/opt/nifi/nifi-current/database_repository \
  -v nifi-flowfile-repository:/opt/nifi/nifi-current/flowfile_repository \
  -p 8080:8080 \
  --name nifi \
  docker.io/apache/nifi:1.12.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/nifi'
```

### Remove

```sh
docker rm -f nifi

docker volume rm nifi-logs nifi-provenance-repository nifi-state nifi-conf nifi-content-repository nifi-database-repository nifi-flowfile-repository
```
