# Quarkus Hibernate ORM Panache

##

```sh
#
./mvnw quarkus:add-extension \
  -Dextensions='hibernate-orm-panache, jdbc-postgresql'
```

```properties
quarkus.datasource.db-kind = postgresql
quarkus.datasource.username = user
quarkus.datasource.password = pass
quarkus.datasource.jdbc.url = jdbc:postgresql://localhost:5432/dev

quarkus.hibernate-orm.database.generation = none
```
