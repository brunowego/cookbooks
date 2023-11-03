# Traefik Ingress

TODO

<!-- ```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply \
  -n traefik-system \
  -f -
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: traefik-basic-auth
spec:
  basicAuth:
    secret: authsecret
---
apiVersion: v1
kind: Secret
metadata:
  name: authsecret
data:
  users: |
    $(htpasswd -nb admin pass | base64)
---
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: traefik
spec:
  entryPoints:
  - web
  routes:
  - match: PathPrefix(\`/dashboard\`) || Host(\`traefik.${K8S_DOMAIN}\`)
    kind: Rule
    middlewares:
    - name: traefik-basic-auth
    services:
    - name: traefik-dashboard
      port: 9000
EOF

#
echo -e "[INFO]\thttp://traefik.${K8S_DOMAIN}"
``` -->
