# Examples

##

```sh
sleep 180m && \
  docker exec -i \
    matomo /bin/su \
      -s '/bin/sh' \
      -c '/usr/local/bin/php /var/www/html/console core:archive' \
      www-data &> /tmp/archive.log &
```
