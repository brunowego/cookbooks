# Bower

## Unable to verify the first certificate

```log
bower library#~0.0.0 UNABLE_TO_VERIFY_LEAF_SIGNATURE Request to https://bower.herokuapp.com/packages/library failed: unable to verify the first certificate
```

```sh
{
  "strict-ssl": false,
  "ca": "/etc/ssl/cert.pem"
}
```

## EPERM

```log
bower EPERM, unlink
```

```sh
npm uninstall -g bower && npm update decompress-zip && npm install bower -g
```

## EINVRES

```log
bower EINVRES Request to http://example.com/packages/package failed with 403
```

```sh
git config --global http.sslverify false
```
