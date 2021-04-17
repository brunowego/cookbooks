# NGINX

## CentOS

Configure SELinux to `permissive`.

## Dependencies

Remove existing server configuration in `nginx.conf`:

```sh
sudo sed -ri '38,57 s/^( ?){4}?/    # /' /etc/nginx/nginx.conf
# sudo sed -ri '38,57 s/^( ?){4}?/[[:space:]]*# /' /etc/nginx/nginx.conf
```
