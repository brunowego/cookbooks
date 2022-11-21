# Self Signed

## Cluster Issuer

```sh
#
cat << EOF | kubectl apply \
  -n cert-system \
  -f -
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: selfsigned-issuer
spec:
  selfSigned: {}
EOF

#
kubectl get clusterissuer -o wide

#
kubectl describe clusterissuer selfsigned-issuer

#
kubectl patch ingress/<name> \
  -n <namespace> \
  -p '{"metadata":{"annotations":{"cert-manager.io/issuer":"selfsigned-issuer"}}}'
```

## Ingress Configuration

```sh
#
kubectl annotate ingress \
  <ingress-name> \
  cert-manager.io/cluster-issuer='selfsigned-issuer'

kubectl annotate ingress \
  <ingress-name> \
  kubernetes.io/ingress.class='nginx'
```
