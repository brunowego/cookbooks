# Bower

## Unable to verify the first certificate

> bower library#~0.0.0 UNABLE_TO_VERIFY_LEAF_SIGNATURE Request to https://bower.herokuapp.com/packages/library failed: unable to verify the first certificate

```sh
{
  "strict-ssl": false,
  "ca": "/etc/ssl/cert.pem"
}
```

## EPERM

> bower EPERM, unlink

```sh
npm uninstall -g bower && npm update decompress-zip && npm install -g bower
```

## EINVRES

> bower EINVRES Request to http://domain.com/packages/package failed with 403

```sh
git config --global http.sslverify false
```
