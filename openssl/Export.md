# Export

## List certs

```sh
openssl s_client -connect [hostname]:443 -showcerts
```

## Output

```sh
openssl s_client -connect [hostname]:443 -showcerts -servername [hostname] </dev/null 2>/dev/null | openssl x509 -outform PEM > [filename].pem
```

```sh
openssl x509 -inform PEM -in [filename].pem -outform DER -out [filename].cer
```

```sh
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain [filename].cer
```

## Test

```sh
wget https:/[hostname]:443 --ca-certificate=[filename].pem
```
