# Teleport Application Service

<!--
https://github.com/jefferyb/k8s-teleport/blob/main/README.md
-->

## Docs

- [Code Repository / Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/application-access/guides)
- Docs
  - [Web Application Access](https://goteleport.com/docs/application-access/guides/connecting-apps/)
  - [TCP Application Access (Preview)](https://goteleport.com/docs/application-access/guides/tcp/)
  - [Teleport Configuration Reference](https://goteleport.com/docs/reference/config/)

## Example

### Dependencies

- [Grafana](/grafana/README.md#helm)

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
    - host: grafana.${K8S_DOMAIN}
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
        - grafana.${K8S_DOMAIN}
      secretName: teleport-grafana.tls-secret
EOF
```

### Issues

#### TBD

```log
config: when app_service is enabled, proxy_server must be specified instead of auth_server
```

TODO

#### TBD

```log
ERROR: proxy_server can not be specified when proxy service is enabled
```

TODO

### TBD

```log
config: auth_server or proxy_server is required
```

TODO

### TBD

```log
2023-05-09T19:58:12Z ERRO [PROC:1]    App failed to establish connection to cluster: node "teleport-cluster-proxy-788b869646-pjt56" [d2a492a6-4f2f-4b10-a0b4-c9c8cf1c96d6] can not join the cluster, the token does not allow "App" role. pid:7.1 service/connect.go:119
```

TODO

```sh
#
tctl tokens ls --insecure
```
