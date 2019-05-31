# Apache HTTPd

## Configuration

```sh
sudo useradd -d /var/www -rs /sbin/nologin apache
```

```sh
sudo usermod -aG apache $USER && sudo su - $USER
```

```sh
sudo install -dm 755 -o apache -g apache /var/www
```

## Installation

```sh
curl https://builds.matomo.org/matomo-3.9.1.tar.gz | sudo -u apache tar -xzC /var/www --transform s/matomo/matomo-3.8.0/ matomo --no-same-owner --no-same-permissions
sudo ln -s /var/www/matomo-3.8.0 /var/www/matomo
```

```sh
sudo restorecon -r /var/www/matomo
```

```sh
sudo find /var/www/matomo/ -type d -exec chmod 755 {} \;
sudo find /var/www/matomo/ -type f -exec chmod 644 {} \;
```
