# NGINX

## Configuration

```sh
sudo tee /etc/nginx/default.d/php-fpm.conf << 'EOF'
location ~ ^/(status|ping)$ {
    fastcgi_pass 127.0.0.1:9000;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
}
EOF
```

```sh
sudo systemctl restart nginx
```

## Test

```sh
sudo nginx -t
```
