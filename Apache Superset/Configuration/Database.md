# Database

- [Dependencies](https://superset.incubator.apache.org/installation.html#database-dependencies)

## MySQL

```sh
mysql -ve 'CREATE DATABASE IF NOT EXISTS superset' -u root -p
mysql -ve "CREATE USER 'superset'@'%' IDENTIFIED BY 'superset'" -u root -p
mysql -ve "GRANT ALL PRIVILEGES ON superset.* TO 'superset'@'%'" -u root -p
mysql -ve 'FLUSH PRIVILEGES' -u root -p
```

```sh
pip install mysqlclient
```

```sh
sudo -u superset echo "SQLALCHEMY_DATABASE_URI = 'mysql://superset:superset@127.0.0.1:3306/superset'" >> /etc/superset/superset_config.py
```
