# Teleport Application Service

<!--
https://github.com/jefferyb/k8s-teleport/blob/main/README.md
-->

## Docs

- [Code Repository / Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/application-access/guides)
- [Web Application Access](https://goteleport.com/docs/application-access/guides/connecting-apps/)

## Example

### Dependencies

- [Grafana](/grafana/README.md#helm)

### Configuration

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
kubectl edit configmap teleport-cluster -n teleport-system
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
          uri: http://grafana.grafana-system.svc
          public_addr: grafana.teleport.${DOMAIN}
          labels:
            env: prod
          commands:
            - name: os
              command: ['/usr/bin/uname']
              period: 21s
```

### Ingress

```sh
#
cat << EOF | kubectl apply \
  -n teleport-system \
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
```
