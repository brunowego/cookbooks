# Vaultwarden

<!--
Infrastructure
Platform
-->

**Keywords:** Unofficial Bitwarden, Password Management

## Links

- [Code Repository](https://github.com/dani-garcia/vaultwarden)
- [Wiki](https://github.com/dani-garcia/vaultwarden/wiki)

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
  -h vaultwarden \
  -v vaultwarden-data:/data \
  -e WEBSOCKET_ENABLED='true' \
  -p 8080:80 \
  -p 3012:3012 \
  --name vaultwarden \
  --network workbench \
  docker.io/vaultwarden/server:1.21.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f vaultwarden

docker volume rm vaultwarden-data
```

## Helm

### References

- [Values](https://github.com/sebastiangaiser/helm-charts/tree/main/charts/vaultwarden#values)

### Repository

```sh
helm repo add sebastiangaiser 'https://sebastiangaiser.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns vaultwarden
# kubectl create ns security

#
kubens vaultwarden

#
helm search repo -l sebastiangaiser/vaultwarden

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install vaultwarden sebastiangaiser/vaultwarden \
  --version 0.8.4 \
  -f <(cat << EOF
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: vaultwarden.${K8S_DOMAIN}
      paths:
        - path: /
          pathType: Prefix
  tls:
    - hosts:
        - vaultwarden.${K8S_DOMAIN}
      secretName: vaultwarden.tls-secret

persistence:
  enabled: true
  accessMode: ReadWriteOnce
  size: 1Gi
EOF
)

#
kubectl get all
```

### Status

```sh
kubectl rollout status deployment/vaultwarden
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=vaultwarden' \
  -f
```

### Delete

```sh
helm uninstall vaultwarden

kubectl delete ns vaultwarden \
  --grace-period=0 \
  --force
```

## Tips

### API Key

1. Account settings
2. Security -> Keys
3. API Key -> View API Key
