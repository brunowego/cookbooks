# Database

- [Dependencies](https://superset.incubator.apache.org/installation.html#database-dependencies)

## MySQL

```sh
mysql -u root -p -ve 'CREATE DATABASE IF NOT EXISTS superset'
mysql -u root -p -ve "CREATE USER 'superset'@'%' IDENTIFIED BY 'superset'"
mysql -u root -p -ve "GRANT ALL PRIVILEGES ON `superset`.* TO 'superset'@'%'"
mysql -u root -p -ve 'FLUSH PRIVILEGES'
```

```sh
pip install -U mysqlclient
```

```sh
sudo -u superset echo "SQLALCHEMY_DATABASE_URI = 'mysql://superset:superset@127.0.0.1:3306/superset'" >> /etc/superset/superset_config.py
```
