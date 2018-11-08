# Htpasswd

## Installation

### YUM

```sh
sudo yum check-update
sudo yum -y install httpd-tools
```

## Configuration

```sh
sudo htpasswd -c /etc/nginx/htpasswd [username]
```

Add to `/etc/nginx/conf.d/[name].conf` the below code:

```conf
server {
    auth_basic 'Restricted Access';
    auth_basic_user_file /etc/nginx/htpasswd;
}
```

```sh
sudo systemctl restart nginx
```

## Test

```sh
sudo nginx -t
```
