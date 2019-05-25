# OS X

## Configuration

```sh
tee /usr/local/etc/nginx/servers/[name].conf << 'EOF'
server {
    listen [port];

    location / {
        proxy_set_header Host $host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header X-Real_IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_cache off;
        proxy_pass http://[hostname]:[port];
    }
}

EOF
```

## Service

```sh
brew services restart nginx
```

## Test

```sh
nginx -t
```
