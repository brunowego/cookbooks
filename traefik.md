# Traefik

<!--
https://www.udemy.com/course/the-complete-traefik-training-course/?referralCode=B585BB185AFA05066747
-->

## References

- [Docker-compose basic example](https://docs.traefik.io/v2.0/user-guides/docker-compose/basic-example/)
- [Middlewares Headers](https://doc.traefik.io/traefik/v2.0/middlewares/headers/)

## Plataform

### Tips

<!-- #### CORS

```yml
# Docker
labels:
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.accesscontrolallowmethods=GET,OPTIONS,PUT'
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.accesscontrolalloworigin=*'
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.accesscontrolmaxage=100'
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.addvaryheader=true'
``` -->

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/traefik#configuration)

### Install

```sh
helm install stable/traefik \
  -n traefik \
  --namespace kube-system \
  --set rbac.enabled=true \
  --set kubernetes.ingressEndpoint.useDefaultPublishedService=true
```

### Dashboard

```sh
helm upgrade traefik stable/traefik -f <(yq m <(cat << EOF
dashboard:
  enabled: true
  domain: traefik.$(minikube ip).nip.io
EOF
) <(helm get values traefik))
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Upgrade

```sh
helm upgrade traefik stable/traefik -f <(yq m <(cat << EOF
ssl:
  enabled: true
  enforced: true
  insecureSkipVerify: true
  defaultCert: "$(cat /etc/ssl/certs/example/root-ca.crt | base64 -w 0)"
  defaultKey: "$(cat /etc/ssl/private/example/root-ca.key | base64 -w 0)"
EOF
) <(helm get values traefik))
```

#### Remove

```sh
helm upgrade traefik stable/traefik -f <(yq d <(helm get values traefik) ssl)
```

### Status

```sh
kubectl rollout status deploy/traefik -n kube-system
```

### Logs

```sh
kubectl logs -l 'app=traefik' -n kube-system -f
```

### DNS

```sh
dig @10.96.0.10 traefik.kube-system.svc.cluster.local +short
nslookup traefik.kube-system.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 traefik.$(minikube ip).nip.io +short
nslookup traefik.$(minikube ip).nip.io 10.96.0.10
```

### Delete

```sh
helm delete traefik --purge
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
  -h traefik \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 80:80 \
  -p 8080:8080 \
  --name traefik \
  --network workbench \
  docker.io/library/traefik:v2.0.2
```

```sh
docker exec -i traefik /bin/sh << EOSHELL
mkdir /etc/traefik

cat << EOF > /etc/traefik/traefik.toml
[providers.docker]
  endpoint = "unix:///var/run/docker.sock"

[api]
  dashboard = true
  insecure = true

EOF
EOSHELL
```

```sh
docker restart traefik
```

```sh
xdg-open "http://127.0.0.1:8080" || open "http://127.0.0.1:8080" || echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f traefik
```
