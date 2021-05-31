# Quarkus JDBC H2

## Dependencies

- [H2 Database](/h2.md)

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='jdbc-h2'
```

<!--
<scope>test</scope>
-->

## Datasource Configuration

```ini
%test.quarkus.http.port = 9090

%test.quarkus.datasource.db-kind = h2
%test.quarkus.datasource.jdbc.url = jdbc:h2:mem:test
%test.quarkus.datasource.jdbc.driver = org.h2.Driver
%test.quarkus.datasource.devservices = false

# ORM Configuration
%test.quarkus.hibernate-orm.dialect = org.hibernate.dialect.H2Dialect
%test.quarkus.hibernate-orm.database.generation = create
%test.quarkus.hibernate-orm.sql-load-script = META-INF/sql/import-test.sql
%test.quarkus.hibernate-orm.log.sql = true
```

<!--
jdbc:h2:mem:test;MODE=PostgreSQL
-->

```sh
cat << EOF > ./src/main/resources/META-INF/sql/import-test.sql
-- insert records

EOF
```

## Issues

### Agroal Connection Configurer

```log
2021-05-30 09:48:54,726 WARN  [io.qua.agr.run.AgroalConnectionConfigurer] (Quarkus Main Thread) Agroal does not support detecting if a connection is still usable after an exception for database kind: h2
```

TODO

###

```log
Caused by: org.h2.jdbc.JdbcSQLException: Hexadecimal string contains non-hex character: "53fcf678-10b7-4cd6-a306-1535ccf133ac";
```

```java
//
@Column(columnDefinition = "uuid")

//
@JoinColumn(columnDefinition = "uuid")
```
