# Running

## Environment

```sh
sudo mv /opt/apache-hive/conf/hive-env.sh.template /opt/apache-hive/conf/hive-env.sh
```

```sh
sudo sed -ri 's|^# HADOOP_HOME=.+|HADOOP_HOME=/opt/hadoop|g' /opt/apache-hive/conf/hive-env.sh
```

```sh
sudo tee -a /opt/apache-hive/conf/hive-env.sh << EOF

# Set HBASE_HOME to point to a specific hbase install directory
HBASE_HOME=/opt/hbase
EOF
```

### PostgreSQL

TODO

### MySQL

```sh
curl -L https://downloads.mysql.com/archives/get/file/mysql-connector-java-5.1.46.tar.gz | tar -xzC /tmp
( cd /tmp/mysql-connector-java-5.1.46 && sudo mv mysql-connector-java-5.1.46-bin.jar /opt/apache-hive/lib ) && rm -r /tmp/mysql-connector-java-5.1.46
```

```sh
mysql -u root -p -ve 'CREATE DATABASE IF NOT EXISTS hive'
mysql -u root -p -ve "CREATE USER 'hive'@'%' IDENTIFIED BY 'hive'"
mysql -u root -p -ve "GRANT ALL PRIVILEGES ON `hive`.* TO 'hive'@'%'"
mysql -u root -p -ve 'FLUSH PRIVILEGES'
```

```sh
sudo tee /opt/apache-hive/conf/hive-site.xml << EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>
</configuration>
EOF
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionURL' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v 'jdbc:mysql://127.0.0.1:3306/hive?useSSL=false' /opt/apache-hive/conf/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionDriverName' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'com.mysql.jdbc.Driver' /opt/apache-hive/conf/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionUserName' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'hive' /opt/apache-hive/conf/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionPassword' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'hive' /opt/apache-hive/conf/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'hive.server2.enable.doAs' /opt/apache-hive/conf/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'false' /opt/apache-hive/conf/hive-site.xml
```

```sh
mysql -u root -p -ve 'USE hive; SOURCE /opt/apache-hive/scripts/metastore/upgrade/mysql/hive-schema-3.1.0.mysql.sql'
```

## Service

### Hive Server

```sh
sudo tee /usr/lib/systemd/system/hive-server2.service << EOF
[Unit]
Description=Hive Server
Documentation=https://hive.apache.org/
After=network.target

[Service]
Type=simple
User=hive
Group=hive
WorkingDirectory=/opt/hive
ExecStart=/opt/apache-hive/bin/hive --service hiveserver2
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hive-server2
```

### Hive Metastore

```sh
sudo tee /usr/lib/systemd/system/hive-metastore.service << EOF
[Unit]
Description=Hive Metastore
Documentation=https://hive.apache.org/
After=network.target

[Service]
Type=simple
User=hive
Group=hive
WorkingDirectory=/opt/hive
ExecStart=/opt/apache-hive/bin/hive --service metastore
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hive-metastore
```

## Logs

TODO
