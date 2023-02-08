# Chatwoot

**Keywords:** Live chat, Customer Service

<!--
https://artifacthub.io/packages/helm/chatwoot/chatwoot
-->

## Links

- [Code Repository](https://github.com/chatwoot/chatwoot)
- [Main Website](https://chatwoot.com)

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
  -e POSTGRES_USER='chatwoot' \
  -e POSTGRES_PASSWORD='chatwoot' \
  -e POSTGRES_DB='chatwoot' \
  -v chatwoot-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name chatwoot-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h chatwoot \
  -e POSTGRES_HOST='chatwoot-postgres' \
  -e POSTGRES_USERNAME='chatwoot' \
  -e POSTGRES_PASSWORD='chatwoot' \
  -e POSTGRES_DATABASE='chatwoot' \
  -p 3000:3000 \
  --name chatwoot \
  --network workbench \
  chatwoot/chatwoot:latest
```

```sh
docker exec chatwoot rails db:migrate

echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f chatwoot-postgres chatwoot

docker volume rm chatwoot-postgres-data
```

## Helm

### References

- [Parameters](https://github.com/chatwoot/charts/tree/main/charts/chatwoot#parameters)

### Repository

```sh
helm repo add chatwoot 'https://chatwoot.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns chatwoot

#
kubens chatwoot

#
helm search repo -l chatwoot/chatwoot

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install chatwoot chatwoot/chatwoot \
  --version 1.0.13 \
  -f <(cat << EOF
ingress:
  enabled: true
  ingressClassName: nginx
  hosts:
    - host: chatwoot.${DOMAIN}
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: chatwoot
              port:
                number: 3000
EOF
)
```

### Status

```sh
kubectl rollout status deploy/chatwoot
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=chatwoot' \
  -f
```

### Delete

```sh
helm uninstall chatwoot

kubectl delete ns chatwoot \
  --grace-period=0 \
  --force
```
