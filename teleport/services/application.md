# Teleport Application Service

<!--
https://github.com/jefferyb/k8s-teleport/blob/main/README.md
-->

## Docs

- [Code Repository / Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/application-access/guides)
- [Web Application Access](https://goteleport.com/docs/application-access/guides/connecting-apps/)
- [TCP Application Access (Preview)](https://goteleport.com/docs/application-access/guides/tcp/)

## Example

### Dependencies

- [Grafana](/grafana/README.md#helm)

### Configuration

```sh
#
kubens teleport

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
kubectl edit configmap teleport-cluster-proxy
```

```yml
---
# ...
data:
  teleport.yaml: |
    # ...
    app_service:
      enabled: true
      # debug_app: true
      apps:
        - name: grafana
          uri: http://grafana.grafana.svc
          public_addr: grafana.teleport.${DOMAIN}
          labels:
            env: prod
          commands:
            - name: os
              command: ['/usr/bin/uname']
              period: 21s
```

```sh
#
kubectl rollout restart deployment teleport-cluster-proxy

#
kubectl logs \
  -l 'app.kubernetes.io/component=proxy' \
  -f

#
tsh login --proxy "teleport.${DOMAIN}" --user admin --insecure

#
tctl status --insecure

#
tctl apps ls --insecure
```

### Ingress

```sh
#
kubens teleport

#
cat << EOF | kubectl apply \
  -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: teleport-grafana
  annotations:
    cert-manager.io/cluster-issuer: letsencrypt-issuer
    nginx.ingress.kubernetes.io/backend-protocol: HTTPS
spec:
  ingressClassName: nginx
  rules:
  - host: grafana.teleport.${DOMAIN}
    http:
      paths:
      - backend:
          service:
            name: teleport-cluster
            port:
              number: 443
        path: /
        pathType: Prefix
  tls:
  - hosts:
    - grafana.teleport.${DOMAIN}
    secretName: teleport-grafana.tls-secret
EOF

#
kubectl rollout restart deployment teleport-cluster -n teleport
```

### Usage

```sh
#
tsh apps ls
```
