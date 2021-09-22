# Issues

## Pandas issue

```log
Was unable to import superset Error: cannot import name '_maybe_box_datetimelike'
```

```sh
pip3 uninstall -y pandas
```

```sh
pip3 install -U pandas==0.23.4
```

## MySQL config

```log
OSError: mysql_config not found
```

```sh
# Homebrew
brew install mysql

# APT
sudo apt update
sudo apt -y install libmariadb-dev

# YUM
yum check-update
sudo yum -y install mysql-community-devel

# APK
sudo apk update
sudo apk add mariadb-dev
```
