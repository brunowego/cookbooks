# Local

## Cluster Issuer

```sh
#
kubectl get clusterissuer -o wide

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
  name: letsencrypt-issuer # or letsencrypt-staging
spec:
  acme:
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    email: ${EMAIL}
    privateKeySecretRef:
      name: letsencrypt-issuer
    solvers:
      - http01:
          ingress:
            class: external-nginx
        selector:
          dnsNames:
            - ${DOMAIN}
EOF

#
kubectl describe clusterissuer letsencrypt-issuer | \
  kubectl neat
```

## Ingress Configuration

```sh
#
kubectl get ingress -A

#
kubectl annotate ingress \
  <ingress-name> \
  cert-manager.io/cluster-issuer='letsencrypt-issuer' \
  -n <namespace>

#
kubectl get clusterissuer,certificates,certificaterequest,order,challenge -A
```

## Issues

### Invalid Solver Configuration

```log
Failed to determine a valid solver configuration for the set of domains on the Order: no configured challenge solvers can be used for this challenge
```

Change domain in `dnsNames`, ex.: `grafana.${K8S_DOMAIN}`.
