# Keychain

## App

### Commands

```sh
security help
```

### Usage

```sh
# Dump
sudo security dump-keychain /System/Library/Keychains/SystemRootCertificates.keychain
```

### Tips

#### Trust Darwin

[Export Web Self-signed Certificate](/openssl.md#export-web-self-signed-certificate).

```sh
# Test
curl -v https://[hostname]

curl \
  --cacert ./selfsigned_certificate.pem \
  -v \
  https://[hostname]

# Or
wget \
  -O - \
  https://[hostname]

wget \
  -O - \
  --ca-certificate=./selfsigned_certificate.pem \
  https://[hostname]

# Add
sudo security add-trusted-cert -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain \
  ./selfsigned_certificate.pem

# Test
curl https://[hostname]

# NOTE: trustAsRoot

# Delete
openssl x509 \
  -in ./selfsigned_certificate.pem \
  -noout \
  -subject

sudo security delete-certificate -c '[hostname]'
```

## Issues

<!-- ###

```log
An error has occurred. Unable to import an item.
The contents of this item cannot be retrieved.
```

TODO -->

### For All Users

```log
This certificate is marked as not trusted for all users
```

Use `trustAsRoot` instead of `trustRoot`.

### Valid Trust Setting Parameter

```log
SecTrustSettingsSetTrustSettings: One or more parameters passed to a function were not valid.
```

Change `trustAsRoot` to `trustRoot`.

<!-- ###

```log
NET::ERR_CERT_VALIDITY_TOO_LONG
``` -->
