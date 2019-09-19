# Traefik

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
  domain: traefik.example.com
EOF
) <(helm get values traefik))
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

### Upgrade

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
dig @10.96.0.10 traefik.example.com +short
nslookup traefik.example.com 10.96.0.10
```

### Delete

```sh
helm delete traefik --purge
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h traefik \
  --name traefik \
  traefik:v1.7.12-alpine /bin/sh
```
