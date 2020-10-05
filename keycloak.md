# Keycloak

<!--
https://github.com/asatrya/keycloak-traefik-tutorial
https://github.com/gyrospectre/traefikrp
https://github.com/ibuetler/docker-keycloak-traefik-workshop
https://gist.github.com/kurt---/7f5415d268f815067252d582044bc99d
-->

## Helm

### References

- [Configuration](https://github.com/codecentric/helm-charts/tree/master/charts/keycloak#configuration)

### Repository

```sh
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update codecentric
```

### Install

```sh
kubectl create namespace keycloak
```

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n keycloak
```

```sh
helm install codecentric/keycloak \
  -n keycloak \
  --namespace keycloak \
  --set keycloak.username=admin \
  --set-string keycloak.ingress.enabled=true \
  --set keycloak.ingress.hosts={keycloak.example.com} \
  --set 'keycloak.ingress.tls[0].secretName=example.tls-secret' \
  --set 'keycloak.ingress.tls[0].hosts={keycloak.example.com}' \
  --set keycloak.persistence.deployPostgres=true \
  --set keycloak.persistence.dbVendor=postgres
```

### Status

```sh
kubectl rollout status statefulset/keycloak -n keycloak
```

### Secret

```sh
kubectl get secret keycloak-http \
  -o jsonpath='{.data.password}' \
  -n keycloak | \
    base64 --decode; echo
```

### Delete

```sh
helm delete keycloak --purge
kubectl delete namespace keycloak --grace-period=0 --force
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
  -h postgres \
  -e POSTGRES_USER='keycloak' \
  -e POSTGRES_PASSWORD='keycloak' \
  -e POSTGRES_DB='keycloak' \
  -v keycloak-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name keycloak-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h keycloak \
  -e DB_VENDOR=postgres \
  -e DB_ADDR=keycloak-postgres \
  -e DB_USER=keycloak \
  -e DB_PASSWORD=keycloak \
  -e DB_DATABASE=keycloak \
  -e DB_SCHEMA=public \
  -e KEYCLOAK_USER=admin \
  -e KEYCLOAK_PASSWORD=admin \
  -p 8080:8080 \
  -p 8443:8443 \
  --name keycloak \
  --network workbench \
  docker.io/jboss/keycloak:8.0.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f keycloak-postgres keycloak
docker volume rm keycloak-postgres-data
```
