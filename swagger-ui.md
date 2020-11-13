# Swagger UI

<!--
https://www.linkedin.com/learning/building-apis-with-swagger-and-the-openapi-specification/open-source-tools
-->

## References

- [Download](https://swagger.io/tools/swagger-ui/download/)

## Helm

### References

- [Configuration](https://github.com/cetic/helm-swagger-ui#configuration)

### Repository

```sh
helm repo add cetic https://cetic.github.io/helm-charts
helm repo update cetic
```

### Install

```sh
kubectl create namespace swagger
```

```sh
helm install cetic/swaggerui \
  -n swagger-ui \
  --namespace swagger \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.hosts={swagger-ui.example.com}
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n swagger
```

```sh
helm upgrade swagger-ui cetic/swaggerui -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - swagger-ui.example.com
EOF
) <(helm get values swagger-ui))
```

#### Remove

```sh
helm upgrade swagger-ui cetic/swaggerui -f <(yq d <(helm get values swagger-ui) ingress.tls)

kubectl delete secret example.tls-secret -n swagger
```

### Status

```sh
kubectl rollout status deploy/swagger-ui-swaggerui -n swagger
```

### Logs

```sh
kubectl logs -l 'app=swaggerui' -n swagger -f
```

### DNS

```sh
dig @10.96.0.10 swagger-ui-swaggerui.swagger.svc.cluster.local +short
nslookup swagger-ui-swaggerui.swagger.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 swagger-ui.example.com +short
nslookup swagger-ui.example.com 10.96.0.10
```

### Delete

```sh
helm delete swagger-ui --purge
kubectl delete namespace swagger --grace-period=0 --force
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
  -h swagger-ui \
  -p 8080:8080 \
  --name swagger-ui \
  --network workbench \
  docker.io/swaggerapi/swagger-ui:v3.32.3
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f swagger-ui
```
