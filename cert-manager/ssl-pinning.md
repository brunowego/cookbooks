# SSL Pinning

## Dependencies

- [Kubernetes Control (kubectl)](/kubectl/README.md)
- [Kubernetes Contexts (kubectx)](/kubectx.md)
- [kubectl-cert-manager](/kubectl/kubectl-cert-manager.md)
- [OpenSSL](/openssl.md)
- [diff](/diff.md)

## Test Case

```sh
#
export DOMAIN='<domain>'

# List certs
openssl s_client \
  -connect "$DOMAIN":443 \
  -showcerts

# Export
openssl s_client \
  -connect "$DOMAIN":443 \
  -showcerts \
  -servername "$DOMAIN" < /dev/null 2> /dev/null | \
    openssl x509 -outform DER > "$DOMAIN".der

#
kubens '<namespace>'

#
export K8S_SECRET_NAME="$(kubectl get ingress -o json | jq -r '.items[] | select(.spec.rules[0].host == "'"$DOMAIN"'") | .spec.tls[0].secretName')"

#
kubectl cert-manager status certificate "$K8S_SECRET_NAME"

#
kubectl cert-manager renew "$K8S_SECRET_NAME"

#
openssl s_client \
  -connect "$DOMAIN":443 \
  -showcerts \
  -servername "$DOMAIN" < /dev/null 2> /dev/null | \
    openssl x509 -outform DER > "$DOMAIN"-new.der

#
diff -e "$DOMAIN".der "$DOMAIN"-new.der > ./diff.txt
```
