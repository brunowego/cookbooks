# Budibase

**Keywords:** Low-Code

## Links

- [Code Repository](https://github.com/Budibase/budibase)
- [Main Website](https://budibase.com)

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
  -h budibase \
  -v budibase-data:/data \
  -p 8080:80 \
  -p 8443:443 \
  -p 9100:9100 \
  --name budibase \
  --network workbench \
  docker.io/budibase/budibase:v2.2.3
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f budibase

docker volume rm budibase-data
```

## Helm

### References

- [Chart Repository](https://github.com/Budibase/budibase/tree/develop/charts/budibase)

<!-- ### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
``` -->

### Install

```sh
#
kubectl create ns budibase
# kubectl create ns lowcode

#
git clone https://github.com/Budibase/budibase.git && cd ./budibase/charts/budibase

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm upgrade budibase ./ \
  --namespace budibase \
  -f <(cat << EOF
ingress:
  nginx: false
  className: nginx
  annotations: []
  hosts:
    - host: budibase.${DOMAIN}
      paths:
        - path: /
          pathType: Prefix
          backend:
            service:
              name: proxy-service
              port:
                number: 10000

# services:
#   budibaseVersion: v2.2.3

  # proxy:
  #   resolver: kube-dns.kube-system.svc.cluster.local
EOF
)

#
kubectl get all -n budibase
```

```sh
kubectl port-forward \
  --address 0.0.0.0 \
  service/proxy-service \
  10000:10000 \
  -n budibase
```

### Status

```sh
kubectl rollout status deployment/proxy-service \
  -n budibase
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=budibase-proxy' \
  -n budibase \
  -f
```

### Issues

#### TBD

```log
2023/01/03 16:57:40 [error] 25#25: recv() failed (111: Connection refused) while resolving, resolver: 127.0.0.11:53
```

TODO

### Delete

```sh
helm uninstall budibase \
  -n budibase

kubectl delete ns budibase \
  --grace-period=0 \
  --force
```
