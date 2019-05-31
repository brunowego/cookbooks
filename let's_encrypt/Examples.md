# Examples

##

```sh
sudo certbot --apache --renew-by-default -d datalayer.io
```

```sh
sudo certbot certonly --apache -d datalayer.io
```

```sh
sudo certbot renew --apache
```

```sh
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

0 */12 * * * root certbot -q renew --apache
```
