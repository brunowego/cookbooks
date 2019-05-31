# Debugging

```sh
# Check an MD5 hash of the public key to ensure that it matches with what is in a CSR or private key
openssl x509 -noout -modulus -in certificate.crt | openssl md5
openssl rsa -noout -modulus -in privateKey.key | openssl md5
openssl req -noout -modulus -in CSR.csr | openssl md5
# Check an SSL connection. All the certificates (including Intermediates) should be displayed
openssl s_client -connect www.paypal.com:443
```
