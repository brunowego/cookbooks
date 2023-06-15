# Teleport Connect

## Links

- [Download](https://goteleport.com/download)

## App

### Installation

#### Homebrew

```sh
brew install --cask teleport-connect
```

## Issues

### Not Trusted Certificate

```log
2 UNKNOWN: Get "https://<teleport-domain>/webapi/ping": x509: “Kubernetes Ingress Controller Fake Certificate” certificate is not trusted
```

<!-- ```sh
echo -n | \
  openssl s_client -connect teleport.192.168.64.16.nip.io:443 | \
  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ./certificate.crt

sudo security add-trusted-cert -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain \
  ./certificate.crt
``` -->

```sh
open -a 'Teleport Connect' --args --insecure
```
