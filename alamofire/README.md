# Alamofire

<!--
https://onurgenes.com/posts/ssl-pinning-with-alamofire
-->

## Links

- [Code Repository](https://github.com/Alamofire/Alamofire)

## Tips

### Prevent SSL Pinning

```sh
# List certs
openssl s_client \
  -connect <domain>:443 \
  -showcerts

# Export
openssl s_client \
  -connect <domain>:443 \
  -showcerts \
  -servername <domain> < /dev/null 2> /dev/null | \
    openssl x509 -outform DER > <filename>.der
```

<!--
CER
DER
PEM
-->

<!-- ```swift
let sessionManager: SessionManager = {
  let serverTrustPolicies: [String: ServerTrustPolicy] = [
    "<domain>": .pinCertificates(
      certificates: ServerTrustPolicy.certificates(),
      validateCertificateChain: true,
      validateHost: true),
  ]

  return SessionManager(serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
}()
```

```swift
sessionManager.request("https://<domain>").responseString { dataResponse in
  switch dataResponse.result {
  case let .failure(err):
    print(err)
  case let .success(val):
    print(val)

    if let headerFields = dataResponse.response?.allHeaderFields {
      print(headerFields)
    }
  }
}
``` -->
