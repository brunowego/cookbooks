# Metadata Storage

- [Reference](http://druid.io/docs/latest/dependencies/metadata-storage.html)

## MySQL

```sh
curl -L https://downloads.mysql.com/archives/get/file/mysql-connector-java-5.1.46.tar.gz | tar -xzC /tmp
( cd /tmp/mysql-connector-java-5.1.46 && sudo mv mysql-connector-java-5.1.46-bin.jar /opt/apache-druid/extensions/mysql-metadata-storage ) && rm -r /tmp/mysql-connector-java-5.1.46
```

```sh
sudo sed -i '51,54 s/^/#/' /opt/apache-druid/conf/druid/_common/common.runtime.properties
```

```sh
mysql -u root -p -ve 'CREATE DATABASE IF NOT EXISTS druid DEFAULT CHARACTER SET utf8mb4'
mysql -u root -p -ve "CREATE USER 'druid'@'%' IDENTIFIED BY 'druid'"
mysql -u root -p -ve "GRANT ALL PRIVILEGES ON `druid`.* TO 'druid'@'%'"
mysql -u root -p -ve 'FLUSH PRIVILEGES'
```

```sh
sudo sed -i '/^druid.extensions.loadList/ s/]/, "mysql-metadata-storage"]/' /opt/apache-druid/conf/druid/_common/common.runtime.properties
```

```sh
sudo sed -i '57,60 s/^#//' /opt/apache-druid/conf/druid/_common/common.runtime.properties
```

```sh
sudo sed -i '/^druid.metadata.storage.connector.connectURI/s|jdbc:mysql://db.example.com:3306/druid|jdbc:mysql://127.0.0.1:3306/druid|g' /opt/apache-druid/conf/druid/_common/common.runtime.properties
```

```sh
sudo sed -i '/^druid.metadata.storage.connector.user/ s/\.\.\./druid/g' /opt/apache-druid/conf/druid/_common/common.runtime.properties
```

```sh
sudo sed -i '/^druid.metadata.storage.connector.password/ s/\.\.\./druid/g' /opt/apache-druid/conf/druid/_common/common.runtime.properties
```
