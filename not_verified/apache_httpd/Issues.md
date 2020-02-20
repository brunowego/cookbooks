# Issues

## Cross-Origin Resource Sharing

```log
Font from origin 'http://example.com' has been blocked from loading by Cross-Origin Resource Sharing policy: No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://example.com' is therefore not allowed access.
```

```sh
sudo a2enmod headers
```

```ini
<VirtualHost *:80>
    <Directory /var/www/project/web>
        Header set Access-Control-Allow-Headers "ORIGIN, X-REQUESTED-WITH, CONTENT-TYPE"
        Header set Access-Control-Allow-Methods "POST, GET, OPTIONS, PUT, DELETE"
        Header set Access-Control-Allow-Origin "*"
        Header set Access-Control-Allow-Credentials true
        Header set Access-Control-Max-Age 60000
    </Directory>
</VirtualHost>
```

```sh
# Systemd
sudo systemctl restart apache2
```

## Set the 'ServerName' directive globally to suppress this message

```log
AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 127.0.1.1. Set the 'ServerName' directive globally to suppress this message
```

```sh
echo "ServerName localhost" | sudo tee /etc/apache2/conf-available/[filename].conf
```

```sh
sudo a2enconf servername
```

```sh
# Systemd
sudo systemctl restart apache2
```
