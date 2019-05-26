# Convert

## Convert a DER file (.crt .cer .der) to PEM

```sh
openssl x509 -inform der -in certificate.cer -out certificate.pem
```

```sh
# Convert a PEM file to DER
openssl x509 -outform der -in certificate.pem -out certificate.der
# Convert a PKCS#12 file (.pfx .p12) containing a private key and certificates to PEM
openssl pkcs12 -in keyStore.pfx -out keyStore.pem -nodes
# You can add -nocerts to only output the private key or add -nokeys to only output the certificates.
# Convert a PEM certificate file and a private key to PKCS#12 (.pfx .p12)
openssl pkcs12 -export -out certificate.pfx -inkey privateKey.key -in certificate.crt -certfile CACert.crt
```
