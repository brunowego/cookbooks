# Local

## Cluster Issuer

```sh
#
kubectl get clusterissuer -o wide

#
export EMAIL='<email>'

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
EOF

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
kubectl get clusterissuer,certificates,certificaterequest,order,challenge -A
```