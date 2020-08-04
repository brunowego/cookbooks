# Keychain

## App

### Usage

```sh
# Add
sudo security add-trusted-cert -d \
  -r trustAsRoot \
  -k /Library/Keychains/System.keychain \
  [/path/to/cert]

# Delete
# sudo security dump-keychain /System/Library/Keychains/SystemRootCertificates.keychain

# sudo security delete-certificate -d \
#   -Z '' \
#   -k /Library/Keychains/System.keychain
```

## Issues

### For All Users

```log
This certificate is marked as not trusted for all users
```

Use `trustAsRoot` instead of `trustRoot`.

###

```log
SecTrustSettingsSetTrustSettings: One or more parameters passed to a function were not valid.
```

Change `trustAsRoot` to `trustRoot`.

###

```log
NET::ERR_CERT_VALIDITY_TOO_LONG
```
