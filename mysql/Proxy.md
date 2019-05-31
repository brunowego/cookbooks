# Proxy

## Nginx

### OS X

Add to `/usr/local/etc/nginx/nginx.conf` the below code:

```conf
stream {
    upstream mysql {
        server [hostname]:3306;
    }

    server {
        listen 3306;

        proxy_connect_timeout 1s;
        proxy_pass mysql;
    }
}
```

```sh
brew services restart nginx
```
