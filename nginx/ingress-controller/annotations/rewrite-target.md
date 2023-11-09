# Rewrite Target

<!--
nginx.ingress.kubernetes.io/use-regex: 'true'
nginx.ingress.kubernetes.io/ssl-redirect: 'false'
nginx.ingress.kubernetes.io/proxy-read-timeout: '3600'
nginx.ingress.kubernetes.io/upstream-vhost: localhost
-->

## Configuration

```yml
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: acme
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1
spec:
  ingressClassName: nginx
  rules:
    - host: acme.k8s.orb.local
      http:
        paths:
          - path: /api/(.*)
            pathType: ImplementationSpecific
            backend:
              service:
                name: acme
                port:
                  number: 9000
```

## Issues

### TBD

```log
Uncaught SyntaxError: Unexpected token '<' (at <filename>:1:1)
```

TODO
