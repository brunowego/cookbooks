# Elastic Logstash

## Helm

### References

- [Configuration](https://github.com/elastic/helm-charts/tree/master/logstash#configuration)

### Repository

```sh
helm repo add elastic 'https://helm.elastic.co'
helm repo update
```

### Dependencies

- Assuming there is already a `elastic` namespace.

### Install

```sh
#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN='${KUBERNETES_IP}.nip.io'

#
helm install logstash elastic/logstash \
  --namespace elastic \
  --version 7.14.0 \
  -f <(cat << EOF
ingress:
  enabled: true
  hosts:
  - host: logstash.${DOMAIN}
    paths:
    - path: /logs
      servicePort: 8080
EOF
)
```

> Wait! This process take a while.

### Status

```sh
kubectl rollout status statefulset/logstash-logstash \
  -n elastic
```

### Logs

```sh
kubectl logs \
  -l 'release=logstash' \
  -n elastic \
  -f
```

### Delete

```sh
helm uninstall logstash \
  -n elastic
```
