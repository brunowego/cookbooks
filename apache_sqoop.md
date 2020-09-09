# Apache Sqoop

## References

- [Feature Differences - Sqoop 1 and Sqoop 2](https://www.cloudera.com/documentation/enterprise/5-14-x/topics/cdh_ig_sqoop_vs_sqoop2.html)

## CLI

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-7-jre
```

#### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk
```

### Installation

#### Homebrew

```sh
brew install sqoop
```

#### Linux

```sh
sudo mkdir /usr/local/sqoop && cd "$_"
```

```sh
curl https://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz | \
  sudo tar -xz --strip-components 1
```

### Environment

#### Linux

```sh
sudo tee /etc/profile.d/sqoop.sh << 'EOF'
export SQOOP_HOME="/usr/local/sqoop"
export PATH="$SQOOP_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

<!-- ###

```sh
sudo mkdir -p /usr/local/accumulo
sudo mkdir -p /usr/local/zookeeper
```

```sh
sudo ln -s /usr/local/hive/hcatalog /usr/local/hcatalog
``` -->

### Drivers

```sh
# MySQL
## Linux
curl -L 'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz' | \
  sudo tar -xzC /usr/local/sqoop/lib mysql-connector-java-5.1.47/mysql-connector-java-5.1.47.jar --strip-components 1

# PostgreSQL
## Linux
curl -o /usr/local/sqoop/lib/postgresql-9.4-1201.jdbc4.jar 'https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc4.jar'
```

### Usage

#### Export

##### Basic

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --export-dir '[/some/hdfs/dir]'
```

##### Columns

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --columns 'name,employee_id,jobtitle' \
  --export-dir '[/some/hdfs/dir]'
```

##### Update

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --update-key 'id'
  --update-mode updateonly
  --export-dir '[/some/hdfs/dir]'
```

###### Insert if missing

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --update-key 'id'
  --update-mode allowinsert
  --export-dir '[/some/hdfs/dir]'
```

##### Specified field, and line terminators, and specified enclosure

```sh
sqoop export \
  --connect jdbs:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --input-enclosed-by \' \
  --input-fields-terminated-by \t \
  --input-lines-terminated-by \r
  --export-dir '[/some/hdfs/dir]'
```

#### Import

##### Basic

```sh
sqoop import \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --warehouse-dir '[/some/hdfs/dir]'
```

> Use `--direct` option to increase performance.

##### All tables

```sh
sqoop import-all-tables \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --warehouse-dir '[/some/hdfs/dir]'
```

##### Parameters

```sh
sqoop import \
  -m #mappers \

  --columns 'name,employee_id,jobtitle' \
  --query "SELECT * FROM tableName WHERE $CONDITIONS AND name = Joe" \
  --where 'name = Joe' \
  --enclosed-by \" \
  --fields-terminated-by \t \
  --lines-terminated-by \r \

  --incremental append \
  --check-column 'id' \

  --incremental lastmodified \
  --last-value '2018-01-01' \
  --check-column 'date' \

  --as-textfile \
  --as-avrodatafile \
  --as-parquetfile \
  --as-sequencefile \

  --compression-codec 'gzip' \
  --compression-codec 'bzip2' \
  --compression-codec 'snappy' \

  --compress \

  --map-column-hive \

  --hive-import \
  --hive-database \
  --hive-overwrite \
  --hive-home /user/hive/warehouse \
  --hive-table 'otherTableName' \
  --hive-partition-key 'state' \
  --hive-partition-value 'MD' \
  --create-hive-table \

  --split-by id \
  --columns id,name \
  --table customer \
  --target-dir '[/some/hdfs/dir]' \
  --fields-terminated-by ',' \
  --exclude-tables \

  --verbose
```

#### Miscellaneous

##### Hive table without any data

```sh
sqoop create-hive-table \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table 'sqlTable' \
  --hive-table 'hiveTable'
```

##### Evaluate a statement against a database

```sh
sqoop eval \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --query 'SELECT * FROM [table-name] LIMIT 10'
```

##### List Databases available on a server

```sh
sqoop list-databases \
  --connect jdbc:mysql://[hostname]:3306 \
  --username [username] \
  --password [password]
```

##### List tables available within a database

```sh
sqoop list-tables \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password]
```

### Queries

#### Exit

```sh
:x
```

### Issues

#### MBean Trust Permission

```log
ERROR Could not register mbeans java.security.AccessControlException: access denied ("javax.management.MBeanTrustPermission" "register")
```

```sh
sudo sed -i '/grant *{/a \        permission javax.management.MBeanTrustPermission "register";' ${JAVA_HOME}/jre/lib/security/java.policy
```
