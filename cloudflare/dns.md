# Cloudflare DNS

## Issues

### TBD

```log
ERR_TOO_MANY_REDIRECTS
```

<!--
https://developers.cloudflare.com/ssl/troubleshooting/too-many-redirects
https://www.youtube.com/watch?v=LMUN1BCcp6s
-->

1. [Dashboard](https://dash.cloudflare.com)
2. Websites -> Select one
3. SSL/TLS -> Your SSL/TLS encryption mode is Flexible -> Full (strict)

### TBD

```log
ERR_NAME_NOT_RESOLVED
```

```sh
#
export DOMAIN='xyz.tld'

dig "$DOMAIN" +short NS
```

Try use something like TunnelBear and change to another country.

### TBD

```log
Registry status: Client transfer prohibited. Please unlock and allow a few hours to update.
```

TODO
