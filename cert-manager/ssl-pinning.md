# SSL Pinning

## Dependencies

- [Kubernetes Control (kubectl)](/kubectl/README.md)
- [Kubernetes Contexts (kubectx)](/kubectx.md)
- [kubectl-cert-manager](/kubectl/commands/cert-manager.md)
- [OpenSSL](/openssl.md)

## Issues

- [2402](https://github.com/cert-manager/cert-manager/issues/2402)
- [2239](https://github.com/cert-manager/cert-manager/issues/2239)
- [3954](https://github.com/cert-manager/cert-manager/issues/3954)

## Test Case

**Dependency:** [Export SSL Certificate](/openssl.md#export-ssl-certificate)

```sh
#
kubectl get certificate -A

#
kubens '<namespace>'

#
export DOMAIN='<domain>'
export K8S_SECRET_NAME="$(kubectl get ingress -o json | jq -r '.items[] | select(.spec.rules[0].host == "'"$DOMAIN"'") | .spec.tls[0].secretName')"

#
kubectl cert-manager status certificate "$K8S_SECRET_NAME"

#
kubectl cert-manager renew "$K8S_SECRET_NAME"
```

[Compare](/openssl.md#ssl-certificate-diff) the old and new certificates.

<!--
#
kubectl patch ingress/<name> \
  -n <namespace> \
  -p '{"metadata":{"annotations":{"cert-manager.io/private-key-rotation-policy":"Never"}}}'
-->

<!--
```yml
---
apiVersion: cert-manager.io/v1
kind: Certificate
# ...
spec:
  # ...
  privateKey:
    rotationPolicy: Never # Or Always
```
-->
