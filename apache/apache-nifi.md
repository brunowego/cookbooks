# Apache NiFi

## References

- [NiFiKop](/nifikop.md)

## Helm

### References

- [Configuration](https://github.com/cetic/helm-nifi#configuration)

### Repository

```sh
helm repo add cetic https://cetic.github.io/helm-charts
helm repo update
```

### Install

```sh
kubectl create namespace nifi
```

```sh
helm install nifi cetic/nifi \
  --namespace nifi \
  --set ingress.enabled=true \
  --set ingress.hosts={nifi.$(minikube ip).nip.io}
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n nifi
```

```sh
helm upgrade nifi cetic/nifi -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - nifi.$(minikube ip).nip.io
EOF
) <(helm get values nifi))
```

#### Remove

```sh
helm upgrade nifi cetic/nifi -f <(yq d <(helm get values nifi) ingress.tls)

kubectl delete secret example.tls-secret -n nifi
```

### Status

```sh
kubectl rollout status statefulset nifi -n nifi
```

### Logs

```sh
kubectl logs -l 'app=nifi' -c server -n nifi -f
kubectl logs -l 'app=nifi' -c app-log -n nifi -f
kubectl logs -l 'app=nifi' -c bootstrap-log -n nifi -f
kubectl logs -l 'app=nifi' -c user-log -n nifi -f
```

### DNS

```sh
dig @10.96.0.10 nifi.nifi.svc.cluster.local +short
nslookup nifi.nifi.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "nifi.$(minikube ip).nip.io" +short
nslookup "nifi.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret nifi \
  -o jsonpath='{.data.admin-password}' \
  -n nifi | \
    base64 --decode; echo
```

### Delete

```sh
helm uninstall nifi -n nifi

kubectl delete namespace nifi --grace-period=0 --force
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
