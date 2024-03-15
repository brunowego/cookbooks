# Swagger UI

<!--
https://linkedin.com/learning/building-apis-with-swagger-and-the-openapi-specification/open-source-tools
-->

## Links

- [Code Repository](https://github.com/swagger-api/swagger-ui)
- [Demo](https://petstore.swagger.io)
- [Download](https://swagger.io/tools/swagger-ui/download/)

## Helm

### References

- [Configuration](https://github.com/cetic/helm-swagger-ui#configuration)

### Repository

```sh
helm repo add cetic https://cetic.github.io/helm-charts
helm repo update
```

### Install

```sh
kubectl create ns swagger
```

```sh
helm install swagger-ui cetic/swaggerui \
  --namespace swagger \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.hosts={swagger-ui.xyz.tld}
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls swagger-ui.tls-secret \
  --cert='/etc/ssl/certs/swagger-ui/root-ca.crt' \
  --key='/etc/ssl/private/swagger-ui/root-ca.key' \
  -n swagger
```

```sh
helm upgrade swagger-ui cetic/swaggerui -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: swagger-ui.tls-secret
      hosts:
        - swagger-ui.xyz.tld
EOF
) <(helm get values swagger-ui))
```

#### Remove

```sh
helm upgrade swagger-ui cetic/swaggerui -f <(yq d <(helm get values swagger-ui) ingress.tls)

kubectl delete secret swagger-ui.tls-secret -n swagger
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
dig @10.96.0.10 swagger-ui.xyz.tld +short
nslookup swagger-ui.xyz.tld 10.96.0.10
```

### Delete

```sh
helm uninstall swagger-ui -n swagger-ui

kubectl delete ns swagger --grace-period=0 --force
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

## Issues

### Bypass Content Security Policy (CSP)

```log
Content Security Policy: The page’s settings blocked the loading of a resource at eval (“default-src”).
Content Security Policy: The page’s settings blocked the loading of a resource at inline (“default-src”).
```

1. Open Mozilla Firefox
2. Type in URL: `about:config`
3. Accept the Rist and Continue
4. Modify the follow Preference:
   - `security.csp.enable` to `false`
