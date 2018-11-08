# Issues

## Pandas issue

> Was unable to import superset Error: cannot import name '_maybe_box_datetimelike'

```sh
pip uninstall -y pandas
```

```sh
pip install pandas==0.23.4
```

## MySQL config

> OSError: mysql_config not found

### YUM

```sh
sudo yum check-update
sudo yum -y install mysql-community-devel
```

### APK

```sh
sudo apk update
sudo apk add mariadb-dev
```
