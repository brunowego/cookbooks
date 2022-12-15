# Budibase

## Links

- [Code Repository](https://github.com/Budibase/budibase)
- [Main Website](https://budibase.com/)

## Glossary

- Low-Code Development Platform (LCDP)

## Helm

**WIP:** Currently not working as expected.

### References

- [Chart Repository](https://github.com/Budibase/budibase/tree/develop/charts/budibase)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns budibase-system
# kubectl create ns lowcode

#
git clone https://github.com/Budibase/budibase.git && cd ./budibase/charts/budibase

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install budibase ./ \
  --namespace budibase-system \
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
EOF
)

#
kubectl get all -n budibase-system
```

### Status

```sh
kubectl rollout status deployment/app-service \
  -n budibase-system
```

### Logs

```sh
kubectl logs \
  -l 'io.kompose.service=app-service' \
  -n budibase-system \
  -f
```

### Delete

```sh
helm uninstall budibase \
  -n budibase-system

kubectl delete ns budibase-system \
  --grace-period=0 \
  --force
```
