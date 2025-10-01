# HTTP Security Headers

## Tools

- [SSL Labs Test](https://ssllabs.com/ssltest)
- [Security Headers by Snyk](https://securityheaders.com)

## Tips

### Testing

```sh
#
curl -I http://localhost:3000

#
openssl s_client -connect localhost:3000 -servername localhost -showcerts
```
