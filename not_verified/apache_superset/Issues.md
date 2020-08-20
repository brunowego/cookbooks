# Issues

## Pandas issue

```log
Was unable to import superset Error: cannot import name '_maybe_box_datetimelike'
```

```sh
pip uninstall -y pandas
```

```sh
pip install -U pandas==0.23.4
```

## MySQL config

```log
OSError: mysql_config not found
```

### YUM

```sh
yum check-update
sudo yum -y install mysql-community-devel
```

### APK

```sh
sudo apk update
sudo apk add mariadb-dev
```
