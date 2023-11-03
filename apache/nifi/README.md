# Apache NiFi

<!--
https://app.pluralsight.com/library/courses/building-deploying-monitoring-apache-nifi-dataflow/table-of-contents
-->

**Keywords:** Data Workflow

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
kubectl create ns nifi-system

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install nifi cetic/nifi \
  --namespace nifi-system \
  --version 0.7.8 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - nifi.${K8S_DOMAIN}
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

### Secret

```sh
kubectl get secret nifi \
  -o jsonpath='{.data.admin-password}' \
  -n nifi-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall nifi \
  -n nifi-system

kubectl delete ns nifi-system \
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
