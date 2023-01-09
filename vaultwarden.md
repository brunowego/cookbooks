# Vaultwarden

**Keywords:** Unofficial Bitwarden

## Links

- [Code Repository](https://github.com/dani-garcia/vaultwarden)

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
helm search repo -l sebastiangaiser/vaultwarden

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install vaultwarden sebastiangaiser/vaultwarden \
  --namespace vaultwarden \
  --version 0.8.3 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
    - host: vaultwarden.${DOMAIN}
      paths:
        - path: /
          pathType: Prefix
  tls:
    - hosts:
        - vaultwarden.${DOMAIN}
      secretName: vaultwarden.tls-secret
  ingressClassName: nginx
EOF
)

#
kubectl get all -n vaultwarden
```

### Status

```sh
kubectl rollout status deployment/vaultwarden \
  -n vaultwarden
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=vaultwarden' \
  -n vaultwarden \
  -f
```

### Delete

```sh
helm uninstall vaultwarden \
  -n vaultwarden

kubectl delete ns vaultwarden \
  --grace-period=0 \
  --force
```
