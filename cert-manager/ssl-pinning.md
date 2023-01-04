# SSL Pinning

## Dependencies

- [Kubernetes Control (kubectl)](/kubectl/README.md)
- [Kubernetes Contexts (kubectx)](/kubectx.md)
- [kubectl-cert-manager](/kubectl/commands/cert-manager.md)
- [OpenSSL](/openssl.md)

## GitHub Issues

- [2402](https://github.com/cert-manager/cert-manager/issues/2402)
- [2239](https://github.com/cert-manager/cert-manager/issues/2239)
- [3954](https://github.com/cert-manager/cert-manager/issues/3954)

## Run cURL with SSL Pinning

**Docs:** [Certificate pinning](https://everything.curl.dev/usingcurl/tls/pinning)

```sh
#
export HOSTNAME='wordpress.com'
export SHA256="$(curl -sq https://api.cert.ist/$HOSTNAME | jq -r '.openssl.pubkey.der_sha256')"

curl \
  -I \
  --pinnedpubkey "sha256//$SHA256" \
  "https://$HOSTNAME"
```

## Renew Certificate

```sh
#
kubectl get certificate -A

#
kubens '<namespace>'

#
kubectl get ingress -A

#
export INGRESS_HOST='<host>'
export K8S_SECRET_NAME="$(kubectl get ingress -o json | jq -r '.items[] | select(.spec.rules[0].host == "'"$INGRESS_HOST"'") | .spec.tls[0].secretName')"

#
kubectl cert-manager status certificate "$K8S_SECRET_NAME"

#
kubectl cert-manager renew "$K8S_SECRET_NAME"
```

<!--
#
openssl s_client \
  -showcerts \
  -connect "$HOSTNAME:443" </dev/null 2>/dev/null | \
    openssl x509 -outform PEM > "$HOSTNAME".pem

#
export RSA_KEY="$(openssl x509 -in "$HOSTNAME".pem -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64)"

#
export RSA_KEY="$(openssl rsa -in $HOSTNAME.pem -outform der -pubout 2>/dev/null | openssl dgst -sha256 -binary | openssl enc -base64)"

curl -k --verbose --pinnedpubkey "sha256//$RSA_KEY" "https://$HOSTNAME"
-->

## Tips

### Add Private Key Rotation Policy

**Warning:** Not tested.

```sh
#
kubectl patch ingress/<name> \
  -n <namespace> \
  -p '{"metadata":{"annotations":{"cert-manager.io/private-key-rotation-policy":"Never"}}}'
```

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

## Issues

### TBD

```log
curl: (90) SSL: public key does not match pinned public key
```

<!--
https://curl.haxx.se/libcurl/c/libcurl-errors.html#CURLESSLPINNEDPUBKEYNOTMATCH
-->

```sh
#
curl \
  -kv \
  --pinnedpubkey "sha256//$RSA_KEY" "https://$HOSTNAME"
```

```log
*  SSL certificate verify result: unable to get local issuer certificate (20), continuing anyway.
```

TODO
