# Let's Encrypt

## Issuer Names

| Environment | Issuer Name           |
| ----------- | --------------------- |
| Default     | `letsencrypt-issuer`  |
| Testing     | `letsencrypt-testing` |
| Staging     | `letsencrypt-staging` |
| Production  | `letsencrypt-prod`    |

## Issues

### DNS Problem

```log
Error accepting authorization: acme: authorization error for <example.com>: 400 urn:ietf:params:acme:error:dns: During secondary validation: DNS problem: query timed out looking up TXT for _acme-challenge.<example.com>
```

```sh
#
kubectl get certificaterequests

#
kubectl delete certificaterequest <name>

#
kubectl get certificates -o wide

#
kubectl cert-manager renew <name>

#
kubectl cert-manager status certificate <name>
```

<!-- ### Rate Limit

```log
429 urn:ietf:params:acme:error:rateLimited: Error creating new order :: too many certificates already issued for: <domain>: see https://letsencrypt.org/docs/rate-limits/
```

TODO -->
