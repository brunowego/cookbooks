# Extend with HTTPS

## Dependencies

- [mkcert](/mkcert.md)
- [local-ssl-proxy](/local-ssl-proxy.md)

## Using Experimental Flag

**Refer:** `./package.json`

```json
{
  "scripts": {
    "dev": "next dev --experimental-https"
  }
}
```

## Using Proxy

```sh
#
security dump-trust-settings -s

#
mkcert -install

#
security dump-trust-settings -d

#
mkcert localhost

#
npx local-ssl-proxy \
  --key ./localhost-key.pem \
  --cert ./localhost.pem \
  --source 3001 \
  --target 3000
```
