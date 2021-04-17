# Running

## Environment

```sh
sudo mv ${HIVE_CONF_DIR}/hive-env.sh.template ${HIVE_CONF_DIR}/hive-env.sh
```

```sh
sudo mv ${HIVE_CONF_DIR}/hive-log4j2.properties.template ${HIVE_CONF_DIR}/hive-log4j2.properties
```

```sh
sudo sed -i 's/^# HADOOP_HOME=/HADOOP_HOME=/g' ${HIVE_CONF_DIR}/hive-env.sh
```

```sh
sudo tee ${HIVE_CONF_DIR}/hive-site.xml << EOF
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>
</configuration>
EOF
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionURL' ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v "jdbc:postgresql://$(hostname -f):5432/metastore" ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v "jdbc:mysql://$(hostname -f):3306/metastore" ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionDriverName' ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'org.postgresql.Driver' ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'com.mysql.jdbc.Driver' ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionUserName' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'hive' ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'javax.jdo.option.ConnectionPassword' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'hive' ${HIVE_CONF_DIR}/hive-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'hive.server2.enable.doAs' ${HIVE_CONF_DIR}/hive-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'false' ${HIVE_CONF_DIR}/hive-site.xml
```

### PostgreSQL

```sh
sudo curl -o ${HIVE_HOME}/lib/postgresql-9.4-1201.jdbc4.jar https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc4.jar
```

```sh
psql -U postgres -c "CREATE USER 'hive' WITH PASSWORD 'hive'"
psql -U postgres -c "CREATE DATABASE 'metastore' WITH OWNER 'hive'"
psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE 'metastore' TO 'hive'"
```

```sh
schematool -dbType postgres -initSchema
```

### MySQL

```sh
curl -L 'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz' | \
  sudo tar -xzC ${HIVE_HOME}/lib mysql-connector-java-5.1.47/mysql-connector-java-5.1.47.jar --strip-components 1
```

```sh
mysql -u root -p -ve 'CREATE DATABASE IF NOT EXISTS "metastore"'
mysql -u root -p -ve "CREATE USER 'hive'@'%' IDENTIFIED BY 'hive'"
mysql -u root -p -ve "GRANT ALL PRIVILEGES ON `metastore`.* TO 'hive'@'%'"
mysql -u root -p -ve 'FLUSH PRIVILEGES'
```

```sh
schematool -dbType mysql -initSchema
```

## Service

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
ExecStart=${HIVE_HOME}/bin/hive --service metastore
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
ExecStart=${HIVE_HOME}/bin/hiveserver2
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

## Checking

```sh
ss -nlt | grep 10000
```

## Logs

```sh
tail -f /tmp/hive/hive.log
```
