# NGINX Ingress Controller Basic Authentication¶

## Links

- [Docs](https://kubernetes.github.io/ingress-nginx/examples/auth/basic/)

## Configuration

```sh
#
export AUTH_USERNAME='<username>'

#
htpasswd -c auth "$AUTH_USERNAME"

#
kubectl create secret generic basic-auth --from-file=auth
```

Edit ingress adding the following annotations:

```yml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  # ...
  annotations:
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-secret: basic-auth
    nginx.ingress.kubernetes.io/auth-realm: 'Authentication Required - $AUTH_USERNAME'
# ...
```
