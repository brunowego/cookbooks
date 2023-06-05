# Redpanda Console

## Links

- [Code Repository](https://github.com/redpanda-data/console)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redpanda-console \
  -p 8080:8080 \
  --name redpanda-console \
  --network workbench \
  docker.io/redpandadata/console:v2.2.4
```

### Remove

```sh
docker rm -f redpanda-console
```

## Helm

### Dependencies

- [Redpanda](./README.md#helm)

### References

- [Helm Repository](https://github.com/redpanda-data/helm-charts/tree/main/charts/console)

### Install

```sh
#
kubens redpanda

#
helm search repo -l redpanda/console

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install console redpanda/console \
  --version 0.4.0 \
  -f <(cat << EOF
ingress:
  enabled: true
  className: nginx
  hosts:
    - host: redpanda.${DOMAIN}
      paths:
        - path: /
          pathType: ImplementationSpecific

console:
  config:
    kafka:
      brokers:
        - redpanda-external.redpanda.svc:9094
EOF
)

#
kubectl get all
```

### Status

```sh
kubectl rollout status deploy/console
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=console' \
  -f
```

### Delete

```sh
helm uninstall console
```
