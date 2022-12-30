# Alamofire

<!--
https://onurgenes.com/posts/ssl-pinning-with-alamofire
-->

**Keywords:** HTTP Networking, Swift Library

## Links

- [Code Repository](https://github.com/Alamofire/Alamofire)

<!--
CER
DER
PEM
-->

<!--
```swift
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
```
-->
