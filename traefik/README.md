# Traefik

## Links

- [Code Repository](https://github.com/traefik/traefik)
- [Main Website](https://traefik.io)

## Helm

### References

- [Helm Repository](https://github.com/traefik/traefik-helm-chart)

### Repository

```sh
helm repo add traefik 'https://traefik.github.io/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns ingress-traefik

#
kubens ingress-traefik

#
helm search repo -l traefik/traefik

#
helm install traefik traefik/traefik \
  --version 20.8.0 \
  -f <(cat << EOF
service:
  type: ClusterIP
EOF
)
```

### Status

```sh
kubectl rollout status deploy/traefik
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=traefik-ingress-traefik' \
  -f
```

### Usage

```sh
#
kubectl get ingressclasses

#
kubectl get ingressclasses -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.metadata.annotations}{"\n"}{end}' | \
  grep '"ingressclass.kubernetes.io/is-default-class":"true"' | \
    awk '{ print $1}'
```

### Delete

```sh
helm uninstall traefik \
  -n ingress-traefik

kubectl delete ns ingress-traefik \
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
