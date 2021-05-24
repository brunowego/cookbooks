# Quarkus Hibernate ORM Panache

## Guides

- [Quarkus - Simplified Hibernate ORM with Panache](https://quarkus.io/guides/hibernate-orm-panache)

## Alternative

- Spring Data

##

```sh
#
mvn quarkus:add-extension \
  -Dextensions='hibernate-orm-panache, jdbc-postgresql'
```

```ini
quarkus.datasource.db-kind = postgresql
quarkus.datasource.username = user
quarkus.datasource.password = pass
quarkus.datasource.jdbc.url = jdbc:postgresql://localhost:5432/dev

quarkus.hibernate-orm.database.generation = none
quarkus.hibernate-orm.dialect = org.hibernate.dialect.PostgreSQL12Dialect
```

## Dialects

| RDBMS | Driver | Dialect |
| --- | --- | --- |
| DB2 |   | `org.hibernate.dialect.DB2Dialect` |
| DB2 AS/400 |   | `org.hibernate.dialect.DB2400Dialect` |
| DB2 OS390 |   | `org.hibernate.dialect.DB2390Dialect` |
| PostgreSQL (any version) |   | `org.hibernate.dialect.PostgreSQLDialect` |
| PostgreSQL 12  |   | `org.hibernate.dialect.PostgreSQL12Dialect` |
| MySQL |   | `org.hibernate.dialect.MySQLDialect` |
| MySQL with InnoDB |   | `org.hibernate.dialect.MySQLInnoDBDialect` |
| MySQL with MyISAM |   | `org.hibernate.dialect.MySQLMyISAMDialect` |
| Oracle (any version) |   | `org.hibernate.dialect.OracleDialect` |
| Oracle 9i/10g |   | `org.hibernate.dialect.Oracle9Dialect` |
| Sybase |   | `org.hibernate.dialect.SybaseDialect` |
| Sybase Anywhere |   | `org.hibernate.dialect.SybaseAnywhereDialect` |
| Microsoft SQL Server |   | `org.hibernate.dialect.SQLServerDialect` |
| SAP DB |   | `org.hibernate.dialect.SAPDBDialect` |
| Informix |   | `org.hibernate.dialect.InformixDialect` |
| HypersonicSQL |   | `org.hibernate.dialect.HSQLDialect` |
| Ingres |   | `org.hibernate.dialect.IngresDialect` |
| Progress |   | `org.hibernate.dialect.ProgressDialect` |
| Mckoi SQL |   | `org.hibernate.dialect.MckoiDialect` |
| Interbase |   | `org.hibernate.dialect.InterbaseDialect` |
| Pointbase |   | `org.hibernate.dialect.PointbaseDialect` |
| FrontBase |   | `org.hibernate.dialect.FrontbaseDialect` |
| Firebird |   | `org.hibernate.dialect.FirebirdDialect` |
| H2 |   | `org.springside.examples.showcase.orm.hibernate.H2ExtDialect` |
