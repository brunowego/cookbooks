# Local

## Cluster Issuer

```sh
#
export EMAIL='<email>'
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply \
  -n cert-system \
  -f -
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-local
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: ${EMAIL}
    privateKeySecretRef:
      name: letsencrypt-local
    solvers:
      - http01:
          ingress:
            class: nginx
        selector:
          dnsNames:
            - ${DOMAIN}
EOF

#
kubectl get clusterissuer -o wide

#
kubectl describe clusterissuer letsencrypt-local | \
  kubectl neat
```

## Ingress Configuration

```sh
#
kubectl annotate ingress \
  <ingress-name> \
  cert-manager.io/cluster-issuer='letsencrypt-local' \
  -n <namespace>

#
kubectl get clusterissuer,certificates,certificaterequest,order,challenge
```
