# Proxy Pass

## OS X

Add to `/usr/local/etc/nginx/servers/[name].conf` the below code:

```conf
server {
    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real_IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_cache off;
        proxy_pass http://[hostname]:[port];
    }
}
```

```sh
brew services restart nginx
```

## Linux

### Configuration

Add to `/etc/nginx/conf.d/[name].conf` the below code:

```conf
server {
    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Real_IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_cache off;
        proxy_pass http://[hostname]:[port];
    }
}
```

```sh
sudo systemctl restart nginx
```

### Test

```sh
sudo nginx -t
```
