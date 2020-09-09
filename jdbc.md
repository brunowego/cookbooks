# Java Database Connectivity (JDBC)

## Drivers

### MySQL

```sh
curl -L 'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz' | \
  sudo tar -xzC /absolute/path/to/lib mysql-connector-java-5.1.47/mysql-connector-java-5.1.47.jar --strip-components 1
```

### PostgreSQL

```sh
wget \
  -P '/absolute/path/to/lib' \
  --content-disposition \
  'https://jdbc.postgresql.org/download/postgresql-9.4-1201.jdbc4.jar'
```
